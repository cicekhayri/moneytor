require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  describe "GET #new" do
    it "should have status 200" do
      get :new
      expect(response.status).to eq(200)
    end
  end
end
