class FlightPassengersController < ApplicationController
  def destroy
    #@flight = Flight.find(params[:flight_id])
    #@passenger = Passenger.find(params[:id])
    @flightpassenger = FlightPassenger.find_by(    flight_id: params[:flight_id],     passenger_id: params[:id])
    @flightpassenger.destroy
    redirect_to(flights_path)
  end
end
