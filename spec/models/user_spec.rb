require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:slack_name) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:company) }
  end
end
