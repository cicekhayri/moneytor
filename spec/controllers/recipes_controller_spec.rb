require 'rails_helper'

RSpec.describe RecipesController, :type => :controller do
  before do 
    @recipe = FactoryGirl.create(:recipe)
  end

  describe "#new action" do
    it "should have status 200" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "#index action" do
    it "should response with status 200" do
      get :index
      expect(response.status).to eq(200)
    end

    it "should render the index view template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "#create action" do
    it "should response with status 200" do
      post :create, recipe: Recipe.new.attributes
      expect(response.status).to eq(200)
    end

    it "should save to the datebase if successfull" do
      post :create, recipe: { product: "Shoes", purchase_date: "2014-11-11", amount: "200", store_name: "E-Store"}
      recipe = Recipe.last
      expect(recipe.product).to eq("Shoes")
    end

    it "should not save to the database if not successfull" do
      post :create, recipe: { product: "" }
      expect(response).to render_template :new
    end
  end
end
