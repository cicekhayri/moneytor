require 'rails_helper'

RSpec.describe RecipesController, :type => :controller do
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
end
