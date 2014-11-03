require 'rails_helper'

RSpec.describe Category, :type => :model do
  it "should be valid factory" do
    category = FactoryGirl.build(:category)
    expect(category).to be_valid
  end
  
  it "should presence title" do
    category = FactoryGirl.build(:category)
    category.title = nil
    expect(category).not_to be_valid
  end

  it "should presence user" do
    category = FactoryGirl.build(:category)
    category.user = nil
    expect(category).not_to be_valid
  end

end
