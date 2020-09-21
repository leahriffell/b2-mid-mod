class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def passenger_names
    passengers.distinct.order(:name).pluck(:name)
  end
end
