require 'rails_helper'

RSpec.describe UsersController do
  
  context "#new action" do
    it "should have status 200" do
      get :new
      expect(response.status).to eq(200)
    end
  end
end
