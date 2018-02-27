require 'rails_helper'

RSpec.describe Bot::Realtime::Invoices do
  let(:company) { create(:company) }
  let(:user) { create(:user, company: company) }
  let(:customer_name) { Faker::Name.name }
  let(:params) { { company: company, user: user, channel_id: 'channelId' } }
  let(:subject) { Bot::Realtime::Invoices.new(params) }

  before do
    allow_any_instance_of(Bot::Realtime::Invoices).to receive(:notify).and_return(true)
  end

  describe '#get' do
    let(:user) { create(:user, company: company, role: 'admin') }
    let!(:developer) { create(:user) }
    let(:value) { "#{Date.today.strftime("%m-%Y")}" }

    before do
      allow_any_instance_of(Bot::Realtime::Invoices).to receive(:value).and_return value
    end

    it { subject.get; expect(subject.text).to include "#{value}" }

    context 'date_valid?' do
      let(:value) { '13-2018' }

      it { subject.get; expect(subject.text).to include "Invalid date" }
    end

    describe "developer user don't have permissions" do
      let(:user) { create(:user, company: company, role: 'developer') }

      it { subject.get; expect(subject.text).to eq nil }
    end
  end

end
