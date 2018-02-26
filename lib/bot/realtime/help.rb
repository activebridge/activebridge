# frozen_string_literal: true
module Bot
  module Realtime
    class Help < Base
      extend ExecutionHooks
      after_hook :notify

      def show
        text = dayoff_text_message
        text += dayoff_admin_text_message + customer_text_message if user.admin? || user.accountant?
        @text = text
      end

      private

      def customer_text_message
        "List of customers: e.g. `customer list`\nAdd a New customer: e.g. `customer add ActiveBridge LLC`\nDelete a customer: e.g. `customer delete ActiveBridge LLC`\n"
      end

      def dayoff_admin_text_message
        "Add a New dayoff: e.g. `dayoff add ...`\nDelete a dayoff: e.g. `dayoff delete ...`\n"
      end

      def dayoff_text_message
        "List of dayoffs: e.g. `dayoff list`\nAdd a vacation: e.g. `dayoff vacation from `Jan 06, 2017 ` to ` Jan 08, 2017\nAdd a vacation: e.g. `dayoff vacation from `15-03-2017 ` to ` 22-03-2017\n"
      end
    end
  end
end
