# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Bot::Messages::General do
  let(:channel_id) { 'channelID' }
  let(:text) { 'textOtext' }
  let(:params) { { channel_id: channel_id, text: text } }
  let(:options) do
    {
      channel: channel_id,
      text: text,
      as_user: true
    }
  end

  describe '#general' do
    include_examples 'generate a message'
  end
end
