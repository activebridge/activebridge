require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'validations' do
    it { is_expected.to validate_numericality_of(:hours).only_integer.is_greater_than(0).is_less_than_or_equal_to(400) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:customer) }
  end
end
