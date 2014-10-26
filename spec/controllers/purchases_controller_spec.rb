require 'rails_helper'

RSpec.describe PurchasesController, :type => :controller do
  before do 
    @purchase = FactoryGirl.create(:purchase)
  end


  describe "#new action" do
    before do
      @user = FactoryGirl.create(:user)
      login(@user)
    end
    it "should have status 200" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "#index action" do
    before do
      @user = FactoryGirl.create(:user)
      login(@user)
    end
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
    before do
      @user = FactoryGirl.create(:user)
      login(@user)
    end

    it "should response with status 200" do
      post :create, purchase: Purchase.new.attributes
      expect(response.status).to eq(200)
    end

    it "should save to the datebase if successfull" do
      post :create, purchase: { product: "Shoes", purchase_date: "2014-11-11", amount: "200", store_name: "E-Store"}
      purchase = Purchase.last
      expect(purchase.product).to eq("Shoes")
    end

    it "should not save to the database if not successfull" do
      post :create, purchase: { product: "" }
      expect(response).to render_template :new
    end
  end
  
  describe "#show action" do
    before do
      @user = FactoryGirl.create(:user)
      login(@user)
    end
    it "should response with status 200" do
      get :show, id: @purchase.id
      expect(response).to render_template :show
    end
  end


  describe "#update action" do
    before do
      @user = FactoryGirl.create(:user)
      login(@user)
    end
    it "should redirect if update successfull" do
      put :update, id: @purchase, purchase: { product: "test" }
      expect(response).to redirect_to(purchases_path)
    end

    it "should not update if product name is empty" do
      put :update, id: @purchase, purchase: { product: nil }
      expect(response).to render_template('edit')
    end
  end

  describe "#destroy action" do
    it "should destroy the purchase" do
      delete :destroy, id: @purchase.id
      expect(response).to redirect_to(root_url)
    end
  end
end
