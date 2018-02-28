module Bot
  module Realtime
    class Invoices < Base
      extend ExecutionHooks
      after_hook :notify

      def get
        return if user.developer? || value.nil?

        if date_valid?
          @text = "Download invoice #{ENV['HOST']}/download/invoices/" + value.gsub(' ', '_') + ".xlsx"
        else
          @text = "Invalid date"
        end
      end

      def date_valid?
        if value.length == 7
          month_valid?
        elsif value.length == 23
          parse_value
        end
      end

      def parse_value
        unless value.gsub(/from|to/, '').split.map{ |m| m.to_i.between?(1,12) }.include? false
          true
        end
      end

      def month_valid?
        value.to_i.between?(1,12)
      end
    end
  end
end
