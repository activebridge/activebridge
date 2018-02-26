FactoryGirl.define do
  factory :invoice do
    hours 1
    date "2018-02-26"
    confirmed false
    user nil
    customer nil
  end
end
