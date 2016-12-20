require 'rails_helper'

RSpec.describe V1::AgenciesController, type: :controller do

  before(:each) do 
    @agency = FactoryGirl.create(:agency)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns all agencies" do
      get :index
      expect(JSON(response.body).count).to eq(Agency.count)
    end    
  end

  describe "GET #show" do
    it "returns https success" do
      get :show, id: @agency.id
      expect(response).to have_http_status(:success)
    end

    it "returns 404" do
      get :show, id: "RANDOMID"
      expect(response).to have_http_status(:not_found)
    end

    it "returns a record with the specified id" do      
      get :show, id: @agency.id
      record = JSON(response.body)
      expect(record["id"]).to eq(@agency.id)
    end
  end

end
