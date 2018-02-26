# frozen_string_literal: true
module Bot::Messages::InsertHours
  def generate
    {
      channel: @channel_id,
      text: "How many hours did you work for `#{@customer_name}`?",
      as_user: true,
      attachments: []
    }
  end
end
