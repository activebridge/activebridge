module Bot
  module Realtime
    class Invoices < Base
      extend ExecutionHooks
      after_hook :notify

      def get
        return if user.developer? || value.nil?

        @text = "Download invoice https://active-slack-bot.herokuapp.com/download/invoices/" + value
      end
    end
  end
end
