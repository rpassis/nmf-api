class V1::RoutesController < ApplicationController

  def index
    @routes = Route.all
    render json: @routes
  end
  
end
