# frozen_string_literal: true

desc 'Bot track the time of each user on a project for a month'
task accounting_bot: :environment do # should run once in a months (last business day)
  using DateRefinements

  if Date.today == Date.last_business_day_for_current_month
    client = Slack::Client.new

    User.active.developers.each do |user|
      result = client.im_open(user: user.slack_id)
      if result['ok']
        channel_id = result['channel']['id']

        customer = default_customer(user)

        message = Bot::Message.new(channel_id: channel_id, customer_name: customer.name, hours: user.current_month_working_hours)
        message.extend(Bot::Messages::FullTime)
        Invoice.create(customer_id: customer.id, user_id: user.id, hours: user.current_month_working_hours, date: Date.today)
        client.chat_postMessage(message.generate)
      end
    end
  end
end

def default_customer(user)
  unless user.invoices.empty?
    user.last_customer
  else
    Customer.first
  end
end
