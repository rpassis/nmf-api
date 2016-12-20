class V1::TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
    render json: @trip
  end
end
