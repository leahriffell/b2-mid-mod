require 'rails_helper'

RSpec.describe 'Airline Show Page' do
  describe 'As a Visitor' do
    before :each do
      @airline = Airline.create!(name: "Southwest Airlines")

      @flight_1 = @airline.flights.create!(number: "A123")
      @flight_2 = @airline.flights.create!(number: "B456")

      @passenger_1 = @flight_1.passengers.create!(name: "Harry Potter", age: 17)
      @passenger_2 = @flight_1.passengers.create!(name: "Snoopy", age: 10)
      @passenger_3 = @flight_2.passengers.create!(name: "Elmer Dawg", age: 5)
      @flight_2.passengers << @passenger_1
    end

    it "I can see list of unique passengers that have flown on this airline" do 
      visit "/airlines/#{@airline.id}"
      
      expect(page).to have_content("Passengers: #{@airline.passenger_names.join(", ")}")
    end
  end
end