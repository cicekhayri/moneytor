require 'rails_helper'

RSpec.describe Category, :type => :model do
  it "should presence title" do
    category = FactoryGirl.build(:category)
    category.title = nil
    expect(category).not_to be_valid
  end
end
