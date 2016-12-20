require 'rails_helper'

RSpec.describe V1::StopTimesController, type: :controller do

  before(:each) do
    @stop_time = FactoryGirl.create(:stop_time)
  end

  describe "GET #show" do
    it "returns https success" do
      get :show, id: @stop_time.id
      expect(response).to have_http_status(:success)
    end

    it "returns 404" do
      get :show, id: "RANDOMID"
      expect(response).to have_http_status(:not_found)
    end

    it "returns a record with the specified id" do      
      get :show, id: @stop_time.id
      record = JSON(response.body)
      expect(record["id"]).to eq(@stop_time.id)
    end
  end

end
