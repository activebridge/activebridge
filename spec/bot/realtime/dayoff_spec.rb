# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Bot::Realtime::Dayoff do
  let!(:company) { create(:company) }
  let!(:user) { create(:user, company: company) }
  let(:dayoff_date) { attributes_for(:day_off)[:date].to_s }
  let(:workdays_range) { (Date.parse('15-03-2017')..Date.parse('22-03-2017')) }
  let(:params) { { company: company, channel_id: 'channelId', value: dayoff_date, user: user } }
  let(:subject) { Bot::Realtime::Dayoff.new(params) }
  let(:unused_dayoffs_text) { "You are able to use `#{DayOff::DAYOFFS_PER_YEAR - user_dayoffs.count} days` of vacation." }

  before do
    allow_any_instance_of(Bot::Realtime::Dayoff).to receive(:notify).and_return(true)
  end

  describe '#list' do
    let!(:dayoffs) { create_list(:day_off, 5, company: company, user: nil) }
    let(:dayoff_text) { list_of_dates }
    it 'of dayoffs' do
      subject.list
      expect(subject.text).to eq dayoff_text
    end
  end

  describe '#add' do
    let!(:user) { create(:user, company: company, role: 'admin') }
    let(:text) { "Day Off #{dayoff_date} has been created." }
    it 'new dayoff' do
      expect { subject.add }.to change(DayOff, :count).by(1)
      expect(subject.text).to eq text
    end
  end

  describe '#delete' do
    let!(:dayoff) { create(:day_off, company: company, date: dayoff_date, user: nil) }
    let!(:user) { create(:user, company: company, role: 'admin') }
    let(:text) { "Day Off #{dayoff_date} has been deleted." }
    it 'a dayoff' do
      expect { subject.delete }.to change(DayOff, :count).by(-1)
      expect(subject.text).to eq text
    end
  end

  describe '#vacation' do
    let(:params) { { company: company, user: user, channel_id: 'channelId', value: 'I vould like to have a vacation from 15-03-2017 to 22-03-2017' } }
    let(:text) { "You have a vacation for `6 working days`. (2017-03-15 - 2017-03-22)" }

    it 'dayoff' do
      expect { subject.vacation }.to change(DayOff, :count).by(6)
      expect(subject.text).to eq text
    end
  end

  using DateRefinements
  let(:list_of_dates) { Date.print_dates((dayoffs).map(&:date)) }
end
