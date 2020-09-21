require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it {should have_many :flights}
  end

  describe 'instance methods' do 
    before :each do
      @airline = create(:airline)

      @flight_1 = @airline.flights.create!(number: "A123")
      @flight_2 = @airline.flights.create!(number: "B456")

      @passenger_1 = @flight_1.passengers.create!(name: "Harry Potter", age: 17)
      @passenger_2 = @flight_1.passengers.create!(name: "Snoopy", age: 10)
      @passenger_3 = @flight_2.passengers.create!(name: "Elmer Dawg", age: 5)
      @flight_2.passengers << @passenger_1
    end

    describe "it can return an array of all unique passengers' names" do 
      it "#passenger_names" do
        expect(@airline.passenger_names).to eq([@passenger_1.name, @passenger_2.name, @passenger_3.name].sort)
      end
    end
  end
end
