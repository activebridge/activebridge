FactoryGirl.define do
  factory :article do
    title 'Random title'
    body 'Article Body'
    picture File.new(File.join(Rails.root + 'spec/fixtures/image.jpg'))
    review_status :done
    category 'ror-development'
    association :member
  end
end
