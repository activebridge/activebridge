FactoryGirl.define do
  factory :article do
    title 'Random title'
    body 'Sense child do state to defer mr of forty. Become latter but nor abroad wisdom waited. Was delivered gentleman acuteness but daughters. In as of whole as match asked. Pleasure exertion put add entrance distance drawings. In equally matters showing greatly it as. Want name any wise are able park when.'
    picture File.new(File.join(Rails.root + 'spec/fixtures/image.jpg'))
    category_id 1
    user_id 1
  end

end
