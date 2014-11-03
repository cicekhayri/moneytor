require 'rails_helper'

RSpec.describe Purchase, :type => :model do
  it "should have a valid factory" do
    purchase = FactoryGirl.build(:purchase)
    expect(purchase).to be_valid
  end

  it "should validate presence of user" do
    purchase = FactoryGirl.build(:purchase)
    purchase.user = nil
    expect(purchase).not_to be_valid
  end

  it "should presence product name" do
    purchase = FactoryGirl.build(:purchase)
    purchase.product = nil
    expect(purchase).not_to be_valid
  end

  it "should be not allowed different users between purchase and category" do
    purchase = FactoryGirl.build(:purchase)
    purchase.category = FactoryGirl.build(:category)
    expect(purchase).not_to be_valid
  end
end
