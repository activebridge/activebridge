require 'rails_helper'

RSpec.describe DayOff, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:date) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:company) }
  end
end
