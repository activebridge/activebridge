# frozen_string_literal: true
module Bot
  class SlackRealtime
    class << self
      def run
        client = Slack::Client.new
        realtime_client = client.realtime

        realtime_client.on :hello do
          Rails.logger.info 'LETS GO SlackRealtime =======>>>'
        end

        realtime_client.on :message do |params|
          company = Company.find_by(slack_team_id: params['team'])
          generate_response(company, params) if company
        end

        realtime_client.start # listen a STREAM
      end

      private

      def generate_response(company, params)
        class_name, method = params['text'].split
        object = "Bot::Realtime::#{class_name.capitalize}".safe_constantize

        if object && object.instance_methods(false).include?(method&.to_sym)
          object.new(realtime_params(company, params)).send(method)
        elsif params['text']&.downcase&.include? 'help'
          Bot::Realtime::Help.new(realtime_params(company, params)).show
        elsif params['text'].to_i.positive?
          user = company.users.find_by(slack_id: params['user'])
          if user && update_invoice(user, params['text'])
            render_other_project_message(params['channel'])
          end
        end
      end

      def realtime_params(company, params)
        value = params['text'].split[2..-1]&.join(' ')
        user = company.users.find_by(slack_id: params['user'])

        { company: company, user: user, channel_id: params['channel'], value: value }
      end

      def update_invoice(user, slack_message)
        last_invoice = user.invoices.last
        return false unless last_invoice || last_invoice.hours.nil?
        last_invoice.update_attributes(hours: slack_message.to_i)
      end

      def render_other_project_message(channel_id)
        message = Bot::Message.new(channel_id: channel_id)
        message.extend(Bot::Messages::OtherProject)
        Bot::Api.post_message(message: message.generate)
      end
    end
  end
end
