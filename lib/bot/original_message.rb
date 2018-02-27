# frozen_string_literal: true
module Bot
  class OriginalMessage
    attr_accessor :user, :channel_id, :slack_params

    def initialize(params = {})
      @user = params[:user]
      @channel_id = params[:channel_id]
      @slack_params = params[:slack_params]
    end

    def replace
      # callback_id: 'full_time' or 'choose_project' or 'other_project'
      return unless Bot::OriginalMessage.private_method_defined? slack_params[:callback_id]
      message = send(slack_params[:callback_id]).generate
      Bot::Api.update_message replace_params.merge(message: message)
    end

    private

    def full_time
      return choose_project_message unless confirmed?
      Invoice.where(user_id: user.id).last.update(confirmed: true)
      send_to_accountent
      generate_final_message
    end

    def choose_project
      date = Invoice.where(user_id: user.id).last.date
      last_unconfirmed_invoice = Invoice.where(user_id: user.id, confirmed: false).last
      unless last_unconfirmed_invoice.nil?
        last_unconfirmed_invoice.delete
      end

      Invoice.create(customer: customer, user: user, confirmed: true, date: date)
      message.customer_name = customer.name
      message.extend(Bot::Messages::InsertHours)
    end

    def other_project
      return choose_project_message if confirmed?

      send_to_accountent
      generate_final_message
    end

    def choose_project_message
      message.company_id = user.company_id
      message.extend(Bot::Messages::ChooseProject)
    end

    def message
      @message ||= Bot::Message.new(channel_id: @channel_id)
    end

    def customer
      return Customer.find(value) if choose_project?
      user.last_customer
    end

    def replace_params
      {
        response_url: slack_params[:response_url],
        message_ts: slack_params[:message_ts]
      }
    end

    def generate_final_message
      message.text = final_text_message
      message.user_name = user.name
      message.extend(Bot::Messages::Done)
    end

    def final_text_message
      text = ''
      current_month_invoices.where(confirmed: true).each do |invoice|
        text += " • #{invoice.customer_name}: #{invoice.hours} hours. \n"
      end

      text
    end

    def current_month_invoices
      user.invoices.last_months.includes(:customer)
    end

    def send_to_accountent
      message.text = "*#{user.name}* (slack_id: _#{user.slack_name}_):\n" + final_text_message

      Bot::Api.post_message(
        user_slack_id: user.company_accountant.slack_id,
        message: message.extend(Bot::Messages::General).generate
      )
    end

    def confirmed?
      value == 'yes'
    end

    def value
      slack_params[:actions].first[:value]
    end

    def choose_project?
      slack_params[:callback_id] == 'choose_project'
    end
  end
end
