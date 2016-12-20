require 'rails_helper'

RSpec.describe V1::TripsController, type: :controller do

  before(:each) do
    @trip = FactoryGirl.create(:trip)
  end

  describe "GET #show" do
    it "returns https success" do
      get :show, id: @trip.id
      expect(response).to have_http_status(:success)
    end

    it "returns 404" do
      get :show, id: "RANDOMID"
      expect(response).to have_http_status(:not_found)
    end

    it "returns a record with the specified id" do      
      get :show, id: @trip.id
      record = JSON(response.body)
      expect(record["id"]).to eq(@trip.id)
    end
  end

end
