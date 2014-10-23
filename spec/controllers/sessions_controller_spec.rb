require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  describe "GET #new" do
    it "should have status 200" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    it "should create login session" do
      user = FactoryGirl.create(:user, password: "pass323@", password_confirmation: "pass323@")
      post :create, email: user.email, password: "pass323@"
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe "DELETE #destroy" do
    it "should destroy the session and logout" do
      get :destroy
      expect(session[:user_id]).to eq(nil)
    end
  end
end
