# frozen_string_literal: true
class Bot::Api
  class << self
    def update_message(options = {})
      message = options[:message]

      # INFO:: you can respond to a user's command up to
      # 5 times within 30 minutes of the command's invocation.
      response = replace_message(options[:response_url], message)
      return if response.code == 200

      # https://api.slack.com/docs/messages
      # attachments HTTP parameter that accepts a URL-encoded string of a JSON hash
      attachments = message[:attachments].to_json
      client.chat_update(message.merge(ts: options[:message_ts], attachments: attachments))
    end

    def post_message(options = {})
      if options[:user_slack_id]
        result = client.im_open(user: options[:user_slack_id])
        options[:message][:channel] = result['channel']['id']
      end
      client.chat_postMessage(options[:message])
    end

    private

    def replace_message(response_url, message)
      uri = URI.parse(response_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Post.new(uri.path)
      request.add_field('Content-Type', 'application/json')
      request.body = message.to_json
      http.request(request)
    end

    def client
      @client ||= Slack::Client.new
    end
  end
end
