# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Bot::Messages::ChooseProject do
  let(:channel_id) { 'channelID' }
  let(:company) { create(:company) }
  let!(:customers) { create_list(:customer, 7, company: company) }
  let!(:other_companies_customers) { create_list(:customer, 7) }
  let(:params) { { channel_id: channel_id, company_id: company.id } }
  let(:options) do
    actions = []
    # batch_size is 5: limit for slack interactive buttons
    company.customers.find_in_batches(batch_size: 5) do |group|
      group_array = []
      group.each do |customer|
        group_array << {
          name: 'customer',
          text: customer.name,
          type: 'button',
          value: customer.id
        }
      end

      actions << group_array
    end

    attachments = []
    actions.each_with_index do |action, _index|
      attachments << {
        text: '',
        fallback: 'You are not able to check the project.',
        callback_id: 'choose_project',
        color: '#439FE0',
        attachment_type: 'default',
        actions: action
      }
    end

    options = {
      channel: channel_id,
      text: 'Please, select your customer:',
      as_user: true,
      attachments: attachments
    }

    options
  end

  describe '#choose_project' do
    include_examples 'generate a message'
  end
end
