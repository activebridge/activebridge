module ApplicationHelper
  def display_duration_in_words(number)
    if number.to_i < 12
      "#{number} months"
    else
      "#{(number.to_f / 12).round(1)} years"
    end
  end
end
