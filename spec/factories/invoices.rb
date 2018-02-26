FactoryGirl.define do
  factory :invoice do
    hours 160
    user
    customer
  end
end
