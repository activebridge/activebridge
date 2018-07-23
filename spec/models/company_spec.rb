require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:users) }
    it { is_expected.to have_many(:customers) }
    it { is_expected.to have_many(:day_offs) }
  end

  describe '#self.default' do
    let!(:company){ create(:company) }

    it { expect(subject.class.default.name).to eq 'Active Bridge LLC' }
  end
end
