class Passenger < ApplicationRecord
  has_many :flights, through: :flight_passengers
  has_many :flight_passengers
end