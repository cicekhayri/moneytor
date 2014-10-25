require 'rails_helper'

RSpec.describe Purchase, :type => :model do
  it "should presence product name" do
    purchase = FactoryGirl.build(:purchase)
    purchase.product = nil
    expect(purchase).not_to be_valid
  end
end
