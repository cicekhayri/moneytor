require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe "#new action" do
    it "should have status 200" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "#create action" do
    it "should have status 200" do
      post :create, user: User.new.attributes
      expect(response.status).to eq(200)
    end
    
    it "should save user information to the database" do
      post :create, user: @user.attributes
      user = User.last
      expect(user.email).to eq("user1@example.com")
    end

    it "should not get saved to the database if the value is nil" do
      @user.email = nil
      post :create, user: @user.attributes
      expect(response).to render_template :new
    end
  end

  describe "#edit action" do
    it "should have status 200" do
      get :edit, id: @user.id

      expect(response.status).to render_template("edit")
    end
  end

  describe "#update action" do
    it "should redirect to dashbord when success" do
      put :update, { id: @user.id, user: @user.attributes }
      expect(response.status).to eq(302)
    end

    it "should update the user information and save to the database" do
      @user.email = "user1@example.com"
      put :update, {id: @user.id, user: @user.attributes}
      expect(@user.email).to eq(@user.email)
    end

    it "should redirect back to the dit form if the information is not valid" do
      @user.email = nil
      put :update, {id: @user.id, user: @user.attributes}

      expect(response).to render_template :edit
    end
  end

  describe "#destroy action" do
    it "should delete the user and redirect to the root of the app" do
      delete :destroy, id: @user.id
      expect(response.status).to eq(302)
    end
  end
end
