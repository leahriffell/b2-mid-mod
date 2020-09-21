FactoryBot.define do
  factory :flight do
    number { Faker::IDNumber.unique.chilean_id }
    association :airline
    # association :flight_passenger
  end
end