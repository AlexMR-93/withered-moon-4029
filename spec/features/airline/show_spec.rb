require "rails_helper"


RSpec.describe("Flights Show page") do
  before(:each) do
    @airline1 = Airline.create!(    name: "Aero")
    @airline2 = Airline.create!(    name: "Delta")
    @flight1 = @airline1.flights.create!(    number: 1000,     date: "02/09/23",     departure_city: "Berlin",     arrival_city: "Helsinki")
    @flight2 = @airline1.flights.create!(    number: 1212,     date: "12/20/22",     departure_city: "Oslo",     arrival_city: "Denver")
    @flight3 = @airline2.flights.create!(    number: 1700,     date: "07/17/23",     departure_city: "Tokyo",     arrival_city: "Rio")
    @flight4 = @airline2.flights.create!(    number: 6987,     date: "11/09/22",     departure_city: "Moscow",     arrival_city: "Nairobi")
    @passenger1 = Passenger.create!(    name: "Billy",     age: 16)
    @passenger2 = Passenger.create!(    name: "Alex",     age: 17)
    @passenger3 = Passenger.create!(    name: "Rob",     age: 12)
    @passenger4 = Passenger.create!(    name: "Peyton",     age: 36)
    @passenger5 = Passenger.create!(    name: "Gabriel",     age: 45)
    @passenger6 = Passenger.create!(    name: "Sarah",     age: 62)
    @passenger7 = Passenger.create!(    name: "Vanessa",     age: 19)
    @flight_passenger1 = FlightPassenger.create!(    passenger: @passenger1,     flight: @flight1)
    @flight_passenger2 = FlightPassenger.create!(    passenger: @passenger2,     flight: @flight1)
    @flight_passenger3 = FlightPassenger.create!(    passenger: @passenger2,     flight: @flight2)
    @flight_passenger4 = FlightPassenger.create!(    passenger: @passenger4,     flight: @flight2)
    @flight_passenger5 = FlightPassenger.create!(    passenger: @passenger5,     flight: @flight2)
    @flight_passenger6 = FlightPassenger.create!(    passenger: @passenger5,     flight: @flight3)
    @flight_passenger7 = FlightPassenger.create!(    passenger: @passenger6,     flight: @flight3)
    @flight_passenger8 = FlightPassenger.create!(    passenger: @passenger7,     flight: @flight3)
  end

#(Note: an adult is anyone with age greater than or equal to 18)
  describe("Then I see a list of passengers that have flights on that airline") do
    describe("And I see that this list is unique (no duplicate passengers)") do
      it("And I see that this list only includes adult passengers") do
        visit(airline_path(@airline1.id))
        save_and_open_page
        expect(page).to(have_content("Passengers:#{@passenger1.name}"))
      end
    end
  end
end
