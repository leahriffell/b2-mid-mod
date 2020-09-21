require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'relationships' do
    it {should belong_to :airline}
    it {should have_many(:passengers).through(:flight_passengers)}
    it {should have_many :flight_passengers}
  end

  describe 'instance methods' do 
    before :each do 
      airline = create(:airline)

      @flight_1 = airline.flights.create!(number: "A123")

      @passenger_1 = @flight_1.passengers.create!(name: "Harry Potter", age: 17)
      @passenger_2 = @flight_1.passengers.create!(name: "Snoopy", age: 10)
    end

    describe 'it can return an array of all passenger names' do 
      it "#passenger_names" do 
        expect(@flight_1.passenger_names).to eq([@passenger_1.name, @passenger_2.name])
      end
    end

    describe 'it can remove a passenger from a flight' do 
      it "#remove_passenger" do 
        @flight_1.remove_passenger(@passenger_1.id)
        expect(@flight_1.passengers).to eq([@passenger_2])
      end
    end
  end
end
