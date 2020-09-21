require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe 'relationships' do
    it {should have_many(:flights).through(:flight_passengers)}
    it {should have_many :flight_passengers}
  end

  describe 'instance methods' do
    before :each do 
      airline = create(:airline)
      
      flight_1 = airline.flights.create!(number: "A123")
      flight_2 = airline.flights.create!(number: "B456")

      @passenger_1 = flight_1.passengers.create!(name: "Harry Potter", age: 17)
      @passenger_2 = flight_1.passengers.create!(name: "Snoopy", age: 10)
      flight_2.passengers << @passenger_1
    end

    describe 'it can count the num of flights a passenger has been on' do
      it "#flight_count" do
        expect(@passenger_1.flight_count).to eq(2)
        expect(@passenger_2.flight_count).to eq(1)
      end
    end
  end
end
