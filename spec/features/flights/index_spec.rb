require 'rails_helper'

RSpec.describe 'Flights Index Page' do
  describe 'As a Visitor' do
    before :each do
      airline = Airline.create!(name: "Southwest Airlines")

      @flight_1 = airline.flights.create!(number: "A123")
      @flight_2 = airline.flights.create!(number: "B456")

      @passenger_1 = @flight_1.passengers.create!(name: "Harry Potter", age: 17)
      @passenger_2 = @flight_1.passengers.create!(name: "Snoopy", age: 10)
      @passenger_3 = @flight_2.passengers.create!(name: "Elmer Dawg", age: 5)
    end

    it "I can see all flight numbers" do 
      visit "/flights"
      
      expect(page).to have_content("Number: #{@flight_1.number}")
      expect(page).to have_content("Number: #{@flight_2.number}")
    end

    it "I can see each flight's passengers under each flight number" do 
      visit "/flights"

      within("#flight-#{@flight_1.number}") do 
        expect(page).to have_content("#{@passenger_1.name}")
        expect(page).to have_content("#{@passenger_2.name}")
      end

      within("#flight-#{@flight_2.number}") do 
        expect(page).to have_content("#{@passenger_3.name}")
      end
    end

    it "I can remove a passenger from a flight" do 
      visit "/flights"

      within("#passenger-#{@passenger_1.id}") do 
        click_link "Remove from flight"
      end

      expect(current_path).to eq("/flights")

      within("#flight-#{@flight_1.number}") do 
        expect(page).to_not have_content("#{@passenger_1.name}")
      end 
    end
  end
end