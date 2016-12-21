require 'rails_helper'

RSpec.describe V1::RoutesController, type: :controller do

  before(:each) do
    @route = FactoryGirl.create(:route)
  end

  describe "GET #show" do
    it "returns https success" do
      get :show, id: @route.id
      expect(response).to have_http_status(:success)
    end

    it "returns 404" do
      get :show, id: "RANDOMID"
      expect(response).to have_http_status(:not_found)
    end

    it "returns a record with the specified id" do      
      get :show, id: @route.id
      record = JSON(response.body)
      expect(record["id"]).to eq(@route.id)
    end
  end

end
