FactoryGirl.define do
  factory :day_off do
    date { Faker::Date.between(Date.current.beginning_of_month, Date.current.end_of_month) }
    company
    user
  end
end
