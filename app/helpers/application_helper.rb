module ApplicationHelper
  def display_duration_in_words(number)
    if number.to_i < 12
      "#{number} months"
    else
      "#{(number.to_f / 12).round(1)} years"
    end
  end

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: 'alert') do
        message
      end)
    end
    nil
  end
end
