require "rails_helper"


RSpec.describe(Airline, type: :model) do
  describe("relationships") do
    it { should(have_many(:flights)) }
  end

  before(:each) do
    @airline1 = Airline.create!(    name: "Aero")
    @airline2 = Airline.create!(    name: "Delta")
    @flight1 = @airline1.flights.create!(    number: 1000,     date: "02/09/23",     departure_city: "Berlin",     arrival_city: "Helsinki")
    @flight2 = @airline1.flights.create!(    number: 1212,     date: "12/20/22",     departure_city: "Oslo",     arrival_city: "Denver")
    @flight3 = @airline2.flights.create!(    number: 1700,     date: "07/17/23",     departure_city: "Tokyo",     arrival_city: "Rio")
    @flight4 = @airline2.flights.create!(    number: 6987,     date: "11/09/22",     departure_city: "Moscow",     arrival_city: "Nairobi")
    @passenger1 = Passenger.create!(    name: "Billy",     age: 19)
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

  describe("instance method") do
    it("only fans adults") do
      expect(@airline1.only_fans_adults).to(eq([@passenger1.name, @passenger5.name, @passenger4.name]))
    end
  end
end
