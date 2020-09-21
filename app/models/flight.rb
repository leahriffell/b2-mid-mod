class Flight < ApplicationRecord
  belongs_to :airline
  has_many :passengers, through: :flight_passengers
  has_many :flight_passengers
end
