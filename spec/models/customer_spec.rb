require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'association' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to have_many(:invoices) }
  end
end
