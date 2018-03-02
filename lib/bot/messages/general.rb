# frozen_string_literal: true
module Bot::Messages::General
  def generate
    {
      channel: @channel_id,
      text: @text,
      as_user: true
    }
  end
end
