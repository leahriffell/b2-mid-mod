require 'rails_helper'

RSpec.describe 'Flights Index Page' do
  describe 'As a Visitor' do
    before :each do
      airline = Airline.create!(name: "Southwest Airlines")

      @flight_1 = airline.flights.create!(number: "A123")
      @flight_2 = airline.flights.create!(number: "B456")

      @flight_1.passengers.create!(name: "Harry Potter", age: 17)
      @flight_1.passengers.create!(name: "Snoopy", age: 10)
      @flight_2.passengers.create!(name: "Elmer Dawg", age: 5)
    end

    it "I can see all flight numbers" do 
      visit "/flights"
      
      expect(page).to have_content("Number: #{@flight_1.number}")
      expect(page).to have_content("Number: #{@flight_2.number}")
    end

    it "I can see each flight's passengers under each flight number" do 
      visit "/flights"

      within("#flight-#{@flight_1.number}") do 
        expect(page).to have_content("#{@flight_1.passenger_names.join(", ")}")
      end

      within("#flight-#{@flight_2.number}") do 
        expect(page).to have_content("#{@flight_2.passenger_names.join(", ")}")
      end
    end
  end
end