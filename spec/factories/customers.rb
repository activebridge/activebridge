FactoryGirl.define do
  factory :customer do
    name Faker::Name.name
    company
  end
end
