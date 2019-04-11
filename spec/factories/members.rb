FactoryGirl.define do
  sequence(:priority) { |n| n }

  factory :member do
    name 'Alex'
    position 'RoR Developer'
    avatar File.open(File.join(Rails.root, '/spec/fixtures/image.jpg'))
    priority
  end
end
