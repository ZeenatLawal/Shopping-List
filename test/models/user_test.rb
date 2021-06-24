require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:items)
    should have_many(:groups)
  end

  context 'validations' do
    should validate_presence_of(:name)
  end
end
