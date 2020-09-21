FactoryBot.define do
  factory :passenger do
    name { Faker::FunnyName.two_word_name }
    age { Faker::Number.within(range: 1..100) }
    # association :flight
    # association :flight_passenger
  end
end