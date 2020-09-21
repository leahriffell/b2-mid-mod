require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'relationships' do
    it {should belong_to :airline}
    it {should have_many(:passengers).through(:flight_passengers)}
    it {should have_many :flight_passengers}
  end

  describe 'instance methods' do 
    before :each do 
      airline = Airline.create!(name: "Southwest Airlines")

      @flight_1 = airline.flights.create!(number: "A123")

      @passenger_1 = @flight_1.passengers.create!(name: "Harry Potter", age: 17)
      @passenger_2 = @flight_1.passengers.create!(name: "Snoopy", age: 10)
    end

    describe 'it can return an array of all passenger names' do 
      it "#passenger_names" do 
        expect(@flight_1.passenger_names).to eq([@passenger_1.name, @passenger_2.name])
      end
    end
  end
end
