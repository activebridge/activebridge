# frozen_string_literal: true
module Bot::Messages::OtherProject
  def generate
    {
      channel: @channel_id,
      text: 'Would you like to track `any other project`?',
      as_user: true,
      attachments: attachments.to_json
    }
  end

  private

  def attachments
    [
      {
        text: '',
        fallback: 'You are not able to set other projects.',
        callback_id: 'other_project',
        color: '#439FE0',
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
      name: 'other_project',
      text: 'Yes',
      type: 'button',
      value: 'yes'
    }
  end

  def decline
    {
      name: 'other_project',
      text: 'No',
      style: 'primary',
      type: 'button',
      value: 'no'
    }
  end
end
