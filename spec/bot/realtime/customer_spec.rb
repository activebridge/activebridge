# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Bot::Realtime::Customer do
  let(:company) { create(:company) }
  let(:user) { create(:user, company: company) }
  let(:customer_name) { Faker::Name.name }
  let(:params) { { company: company, user: user, channel_id: 'channelId', value: customer_name } }
  let(:subject) { Bot::Realtime::Customer.new(params) }

  before do
    allow_any_instance_of(Bot::Realtime::Customer).to receive(:notify).and_return(true)
  end

  describe '#list' do
    let!(:customers) { create_list(:customer, 5, company: company) }
    let(:cutomer_list) { customers.map(&:name).join("\n") }
    it 'of customers' do
      subject.list
      expect(subject.text).to eq cutomer_list
    end
  end

  describe '#add' do
    let(:user) { create(:user, company: company, role: 'admin') }
    let(:text) { "Customer `#{customer_name}` has been created." }
    it 'new customer' do
      expect { subject.add }.to change(Customer, :count).by(1)
      expect(subject.text).to eq text
    end

    describe "developer user don't have permissions" do
      let(:user) { create(:user, company: company, role: 'developer') }
      it 'add a customer' do
        expect { subject.delete }.to change(Customer, :count).by(0)
        expect(subject.text).to eq nil
      end
    end
  end

  describe '#delete' do
    let(:user) { create(:user, company: company, role: 'admin') }
    let!(:customer) { create(:customer, company: company, name: customer_name) }
    let(:text) { "Customer `#{customer_name}` has been deleted." }
    it 'existing customer' do
      expect { subject.delete }.to change(Customer, :count).by(-1)
      expect(subject.text).to eq text
    end

    describe "developer user don't have permissions" do
      let(:user) { create(:user, company: company, role: 'developer') }
      it 'delete a customer' do
        expect { subject.delete }.to change(Customer, :count).by(0)
        expect(subject.text).to eq nil
      end
    end
  end
end
