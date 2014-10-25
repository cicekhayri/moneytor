require 'rails_helper'

RSpec.describe Recipe, :type => :model do
  it "can not be valid if product name is empty" do
    recipe = FactoryGirl.build(:recipe)
    recipe.product = nil
    expect(recipe).not_to be_valid
  end
end
