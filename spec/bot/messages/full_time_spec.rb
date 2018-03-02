# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Bot::Messages::FullTime do
  let(:channel_id) { 'channelID' }
  let(:customer_name) { 'customer_0_name' }
  let(:hours) { 164 }
  let(:params) { { channel_id: channel_id, hours: hours, customer_name: customer_name } }
  let(:options) do
    {
      channel: channel_id,
      text: "Have you been working `full time` for `#{customer_name}` customer this month?",
      as_user: true,
      attachments: [
        {
          text: "`#{hours} hours`",
          fallback: 'You are not able to set full time.',
          callback_id: 'full_time',
          color: 'good',
          attachment_type: 'default',
          actions: [
            {
              name: 'full_time',
              text: 'Yes',
              style: 'primary',
              type: 'button',
              value: 'yes'
            },
            {
              name: 'full_time',
              text: 'No',
              type: 'button',
              value: 'no'
            }
          ]
        }
      ].to_json
    }
  end

  describe '#full_time' do
    include_examples 'generate a message'
  end
end
