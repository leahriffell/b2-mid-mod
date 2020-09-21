require 'rails_helper'

RSpec.describe 'Passengers Index Page' do
  describe 'As a Visitor' do
    before :each do
      airline = create(:airline)

      @flight_1 = airline.flights.create!(number: "A123")
      @flight_2 = airline.flights.create!(number: "B456")

      @passenger_1 = @flight_1.passengers.create!(name: "Harry Potter", age: 17)
      @passenger_2 = @flight_1.passengers.create!(name: "Snoopy", age: 10)
      @passenger_3 = @flight_2.passengers.create!(name: "Elmer Dawg", age: 5)
      @flight_2.passengers << @passenger_1

      @all_passengers = [@passenger_1, @passenger_2, @passenger_3]
    end

    it "I can see the names of all passengers" do
      visit "/passengers"

      @all_passengers.each do |passenger| 
        expect(page).to have_content("#{passenger.name}")
      end
    end

    it "I can see the number of flights for each passenger" do
      visit "/passengers"
      
      @all_passengers.each do |passenger| 
        within("#passenger-#{passenger.id}") do
          expect(page).to have_content("Total flights: #{passenger.flight_count}")
        end
      end
    end
  end
end