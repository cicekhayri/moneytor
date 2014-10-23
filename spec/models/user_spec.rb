require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "should have valid email" do
      user = FactoryGirl.build(:user)
      user.email = nil
      expect(user).not_to be_valid
    end
  end
end
