# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Bot::Messages::Done do
  let(:channel_id) { 'channelID' }
  let(:text) { 'textOtext' }
  let(:user_name) { 'user_0_name' }
  let(:params) { { channel_id: channel_id, text: text, user_name: user_name } }
  let(:options) do
    {
      channel: channel_id,
      text: text,
      as_user: true,
      attachments: [
        {
          text: "Thank you, my dear #{user_name}. :wink:",
          color: 'good'
        }
      ]
    }
  end

  describe '#done' do
    include_examples 'generate a message'
  end
end
