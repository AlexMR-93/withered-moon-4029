require "rails_helper"


RSpec.describe("Flights Index page") do
  before(:each) do
    @airline1 = Airline.create!(    name: "Aero")
    @airline2 = Airline.create!(    name: "Delta")
    @flight1 = @airline1.flights.create!(    number: 1000,     date: "02/09/23",     departure_city: "Berlin",     arrival_city: "Helsinki")
    @flight2 = @airline1.flights.create!(    number: 1212,     date: "12/20/22",     departure_city: "Oslo",     arrival_city: "Denver")
    @flight3 = @airline2.flights.create!(    number: 1700,     date: "07/17/23",     departure_city: "Tokyo",     arrival_city: "Rio")
    @flight4 = @airline2.flights.create!(    number: 6987,     date: "11/09/22",     departure_city: "Moscow",     arrival_city: "Nairobi")
    @passenger1 = Passenger.create!(    name: "Billy",     age: 21)
    @passenger2 = Passenger.create!(    name: "Alex",     age: 29)
    @passenger3 = Passenger.create!(    name: "Rob",     age: 27)
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

  describe("As a visitor When I visit the flights index page") do
    it("I see a list of all flight numbers") do
      visit(flights_path)

      within("#flight-#{@flight1.id}") do
        expect(page).to(have_content("Flight Number:#{@flight1.number}"))
        expect(page).to(have_content("Airline Name:#{@airline1.name}"))
        expect(page).to(have_content("Passengers:#{@passenger1.name}"))
        expect(page).to(have_content("Passengers:#{@passenger2.name}"))
      end

      within("#flight-#{@flight2.id}") do
        expect(page).to(have_content("Flight Number:#{@flight2.number}"))
        expect(page).to(have_content("Airline Name:#{@airline1.name}"))
        expect(page).to(have_content("Passengers:#{@passenger2.name}"))
        expect(page).to(have_content("Passengers:#{@passenger4.name}"))
        expect(page).to(have_content("Passengers:#{@passenger5.name}"))
      end

      within("#flight-#{@flight3.id}") do
        expect(page).to(have_content("Flight Number:#{@flight3.number}"))
        expect(page).to(have_content("Airline Name:#{@airline2.name}"))
        expect(page).to(have_content("Passengers:#{@passenger6.name}"))
        expect(page).to(have_content("Passengers:#{@passenger7.name}"))
      end
    end
  end

  describe("As a visitor, When I visit the flights index page") do
    describe("I see a link or button to remove that passenger from that flight When I click on that link/button") do
      it("And I no longer see that passenger listed under that flight,And I still see the passenger listed under the other flights they were assigned to") do
        visit(flights_path)

        within("#flight-#{@flight1.id}") do
          within("#passenger-#{@passenger2.id}") do
            expect(page).to(have_link("Remove #{@passenger2.name}"))
            click_link("Remove #{@passenger2.name}")
            expect(current_path).to(eq(flights_path))
          end
        end

        expect(current_path).to(eq(flights_path))

        within("#flight-#{@flight1.id}") do
          expect(page).to_not(have_content("Alex"))
        end

        within("#flight-#{@flight2.id}") do
          expect(page).to(have_content("Alex"))
        end
      end
    end
  end
end
