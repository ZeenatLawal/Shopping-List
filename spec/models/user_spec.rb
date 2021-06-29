require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:items) }
    it { should have_many(:groups) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
