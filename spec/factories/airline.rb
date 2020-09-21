FactoryBot.define do
  factory :airline do
    name { Faker::Company.name }
  end
end