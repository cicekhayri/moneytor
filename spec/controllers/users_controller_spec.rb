require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
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
  end
end
