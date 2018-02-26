# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Bot::Messages::InsertHours do
  let(:channel_id) { 'channelID' }
  let(:customer_name) { 'customer_0_name' }
  let(:params) { { channel_id: channel_id, customer_name: customer_name } }
  let(:options) do
    {
      channel: channel_id,
      text: "How many hours did you work for `#{customer_name}`?",
      attachments: [],
      as_user: true
    }
  end

  describe '#insert_hours' do
    include_examples 'generate a message'
  end
end
