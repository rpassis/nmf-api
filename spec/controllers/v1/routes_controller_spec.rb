require 'rails_helper'

RSpec.describe V1::RoutesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)    
    end

    it "returns all routes" do
      FactoryGirl.create(:route)
      get :index
      expect(JSON(response.body).count).to eq(Route.count)
    end
    
  end

end
