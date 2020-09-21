FactoryBot.define do
  factory :flight do
    number { Faker::IDNumber.chilean_id }
    association :airline
  end
end