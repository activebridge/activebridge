# frozen_string_literal: true

module DateRefinements
  refine Date.singleton_class do
    def last_business_day(date = Date.today)
      beginning_of_month = date.beginning_of_month

      day = beginning_of_month.next_month
      loop do
        day = day.prev_day
        break unless day.saturday? || day.sunday?
      end
      day
    end
    alias_method :last_business_day_for_current_month, :last_business_day

    def workdays
      d1 = Date.new(Time.now.year, Time.now.month, 1) # first day of month\period
      d2 = Date.new(Time.now.year, Time.now.month, -1) # end day of month\period
      wdays = [0, 6] # weekend days by numbers on week
      (d1..d2).reject { |d| wdays.include? d.wday } # Day.wday number day in week
    end
    alias_method :current_month_workdays, :workdays

    def date_range(from_date, until_date, options = {})
      options.symbolize_keys!
      format = options[:format] || :short
      separator = options[:separator] || '—'

      month_names = if format.to_sym == :short
                      I18n.t('date.abbr_month_names')
                    else
                      I18n.t('date.month_names')
                    end

      from_day = from_date.day
      from_month = month_names[from_date.month]
      from_year = from_date.year
      until_day = until_date.day

      dates = { from_day: from_day }

      if from_date.month == until_date.month && from_date.year == until_date.year
        date_format = 'same_month'
        dates.merge!(until_day: until_day, month: from_month, year: from_year)
      else
        until_month = month_names[until_date.month]

        dates.merge!(from_month: from_month, until_month: until_month, until_day: until_day)

        if from_date.year == until_date.year
          date_format = 'different_months_same_year'
          dates[:year] = from_year
        else
          until_year = until_date.year

          date_format = 'different_years'
          dates[:from_year] = from_year
          dates[:until_year] = until_year
        end
      end

      I18n.t("date_range.#{format}.#{date_format}", dates.merge(sep: separator))
    end

    def print_dates(dates, text = '')
      sorted_dates = dates.uniq.sort
      start_range = nil

      sorted_dates.each_with_index do |date, index|
        if (sorted_dates[index + 1] == date + 1.day) && start_range.nil?
          start_range = date
        elsif ((sorted_dates[index + 1] == date + 1.day) || (date.friday? && sorted_dates[index + 1].monday?)) && start_range
          next
        elsif (sorted_dates[index + 1] != date + 1.day) && start_range
          text += "#{date_range(start_range, date)}\n"
          start_range = nil
        else
          text += "#{date.strftime('%b %d, %Y')}\n"
          start_range = nil
        end
      end

      text
    end

  end
end
