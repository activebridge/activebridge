# frozen_string_literal: true
module Bot::Messages::Done
  def generate
    {
      channel: @channel_id,
      text: @text,
      as_user: true,
      attachments: attachments
    }
  end

  private

  def attachments
    [
      {
        text: "Thank you, my dear #{@user_name}. :wink:",
        color: 'good'
      }
    ]
  end
end
