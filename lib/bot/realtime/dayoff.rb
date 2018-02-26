# frozen_string_literal: true
module Bot
  module Realtime
    class Dayoff < Base
      extend ExecutionHooks
      after_hook :notify

      def list
        dayoffs = company.day_offs.general + user.day_offs
        @text = list_of_dates(dayoffs.map(&:date)) + unused_dayoffs_text
      end

      def add
        return if user.developer?
        company.day_offs << ::DayOff.find_or_create_by(date: convert_to_date(value))
        @text = "Day Off #{value} has been created."
      end

      # TODO: delete personal dayoff's
      def delete
        if user.admin? || user.accountant?
          company.day_offs.where(date: convert_to_date(value)).delete_all
          @text = "Day Off #{value} has been deleted."
        else
          @text = "You are not able to delete a dayoff: #{value}."
        end
      end

      def vacation
        range.each { |day| company.day_offs.create!(date: day, user: user) }
        @text = "You have a vacation for `#{range.count} working days`. (#{range.first} - #{range.last})"
      end

      private

      def range
        @range ||= workdays_range - company.day_offs.where(user: nil).map(&:date) # workdays without company dayoffs
      end

      def workdays_range
        from = Date.parse(value) # first day
        to = convert_to_date(value.split('to')[-1]) # last day

        (from..to).reject { |d| [0, 6].include? d.wday } # only workdays
      rescue
        []
      end

      def convert_to_date(a_string)
        Date.parse(a_string)
      rescue
        Date.today + 1.day
      end

      using DateRefinements
      def list_of_dates(dates)
        Date.print_dates(dates)
      end

      def unused_dayoffs_text
        #dayoffs_count = DayOff::DAYOFFS_PER_YEAR - user.day_offs.count
        #return 'Your vacation has been used this year.' unless dayoffs_count.positive?
        #"You are able to use `#{dayoffs_count} days` of vacation."
      end
    end
  end
end
