# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Bot::Messages::OtherProject do
  let(:params) { { channel_id: 'channelID' } }
  let(:options) do
    {
      channel: params[:channel_id],
      text: 'Would you like to track `any other project`?',
      as_user: true,
      attachments: [
        {
          text: '',
          fallback: 'You are not able to set other projects.',
          callback_id: 'other_project',
          color: '#439FE0',
          attachment_type: 'default',
          actions: [
            {
              name: 'other_project',
              text: 'Yes',
              type: 'button',
              value: 'yes'
            },
            {
              name: 'other_project',
              text: 'No',
              style: 'primary',
              type: 'button',
              value: 'no'
            }
          ]
        }
      ].to_json
    }
  end

  describe '#other_project' do
    include_examples 'generate a message'
  end
end
