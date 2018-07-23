# frozen_string_literal: true
module Bot::Messages::FullTime
  def generate
    {
      channel: @channel_id,
      text: "Have you been working `full time` for `#{@customer_name}` customer this month?",
      as_user: true,
      attachments: attachments.to_json
    }
  end

  private

  def attachments
    [
      {
        text: "`#{@hours} hours`",
        fallback: 'You are not able to set full time.',
        callback_id: 'full_time',
        color: 'good',
        attachment_type: 'default',
        actions: actions
      }
    ]
  end

  def actions
    [confirm, decline]
  end

  def confirm
    {
      name: 'full_time',
      text: 'Yes',
      style: 'primary',
      type: 'button',
      value: 'yes'
    }
  end

  def decline
    {
      name: 'full_time',
      text: 'No',
      type: 'button',
      value: 'no'
    }
  end
end
