FactoryGirl.define do
  factory :customer do
    name Faker::Name.name
    company Company.default
  end
end
