FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    slack_name { Faker::Name.name }
    status nil
    slack_id 'U8XT58D0E'
    role 'developer'
    deleted false
    company
  end
end
