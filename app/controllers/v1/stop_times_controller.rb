class V1::StopTimesController < ApplicationController
  def show
    @stop_time = StopTime.find(params[:id])
    render json: @stop_time
  end
end
