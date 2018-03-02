# frozen_string_literal: true
module Bot
  module Realtime
    class Base
      attr_reader :company, :channel_id, :value, :user
      attr_accessor :text
      def initialize(params = {})
        @company = params[:company]
        @channel_id = params[:channel_id]
        @value = params[:value]
        @user = params[:user]

        @text = nil
      end

      private

      def notify
        return unless text # NTF:: call a few times for dayoff's
        message.text = text
        message.extend(Bot::Messages::General)
        Bot::Api.post_message(message: message.generate)
      end

      def message
        @message ||= Bot::Message.new(channel_id: channel_id)
      end
    end
  end
end
