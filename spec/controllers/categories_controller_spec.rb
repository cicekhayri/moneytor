require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do
  before do
    @category = FactoryGirl.create(:category)
  end

  describe "#new action" do
    it "should response with 200" do
      get :new

      expect(response.status).to eq(200)
    end
  end

  describe "#create action" do
    it "should response with 200" do
      post :create, category: Category.new.attributes
      expect(response.status).to eq(200)
    end

    it "should save to the database if successfull" do
      post :create, category: { title: "Category1" }
      category = Category.last
      expect(category.title).to eq("Category1")
    end

    it "should not save to the database if the value is nil" do
      post :create, category: { title: '' }
      expect(response).to render_template :new
    end
  end

  describe "#show action" do
    it 'should response with 200' do
      get :show, id: @category.id

      expect(response).to render_template :show
    end
  end
end