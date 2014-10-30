require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do
  before do
    @category = FactoryGirl.create(:category)
  end

  describe "#index action" do
    before do
      @user = FactoryGirl.create(:user)
      login(@user)
    end

    it "should response with 200" do
      get :index

      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "#new action" do
    before do
      @user = FactoryGirl.create(:user)
      login(@user)
    end

    it "should response with 200" do
      get :new

      expect(response.status).to eq(200)
    end
  end

  describe "#create action" do
    before do
      @user = FactoryGirl.create(:user)
      login(@user)
    end

    it "should response with 200" do
      post :create, category: Category.new.attributes
      expect(response.status).to eq(200)
    end

    it "should save to the database if successfull" do
      post :create, category: { title: "Category1" }
      category = Category.last
      expect(category.title).to eq("Category1")
      expect(category.user_id).to eq(@user.id)
    end

    it "should not save to the database if the value is nil" do
      post :create, category: { title: '' }
      expect(response).to render_template :new
    end
  end

  describe "#show action" do
    before do
      @user = FactoryGirl.create(:user)
      login(@user)
    end

    it 'should response with 200' do
      get :show, id: @category.id

      expect(response).to render_template :show
    end
  end

  describe "#update action" do
    before do
      @user = FactoryGirl.create(:user)
      login(@user)
    end

    it "should redirect if update successfull" do
      put :update, id: @category, category: { title: "category1" }
      expect(response).to redirect_to(category_path(@category))
    end

    it "should not update if not valid title" do
      @category.title = nil
      put :update, {id: @category.id, category: @category.attributes }
      expect(response).to render_template :edit
    end
  end

  describe "#destroy action" do
    before do
      @user = FactoryGirl.create(:user)
      login(@user)
    end

    it "should destroy the category" do
      delete :destroy, id: @category.id
      expect(response).to redirect_to(categories_path)
    end
  end
end
