require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
