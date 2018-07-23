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
        "Add a New dayoff: e.g. `dayoff add ...`\nDelete a dayoff: e.g. `dayoff delete ...`\nDownload invoices: e.g. `invoices get` 02-2018\nDownload invoices: e.g. `invoices get from` 12-2017 `to` 03-2018\n"
      end

      def dayoff_text_message
        "List of dayoffs: e.g. `dayoff list`\n"
      end
    end
  end
end
