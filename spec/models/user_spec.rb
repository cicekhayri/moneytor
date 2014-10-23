require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "should have valid email" do
      user = FactoryGirl.build(:user)
      user.email = nil
      expect(user).not_to be_valid
    end

    it "should have a unique email" do
      new_user = FactoryGirl.build(:user, email: "user1@example.com")
      older_user = FactoryGirl.create(:user)
      new_user.email = older_user.email
      new_user.should_not be_valid
    end

    it "should presence valid password" do
      user = FactoryGirl.build(:user, email: "user1@example.com", password: nil)

      expect(user.valid?).to be false
      expect(user.errors[:password].present?).to be true
    end
  end
end
