class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end

  def update
    flight = Flight.find(params[:id])
    if params[:remove_passenger]
      flight.remove_passenger(params[:passenger])
    end
    redirect_to flights_path
  end
end