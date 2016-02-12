require 'spec_helper'

feature 'Member creates new article', js: true do

  before do
    member = create(:user, role: 1)
    category = create(:category)
    login member
  end

  scenario do
    click_link 'Create Post'
    fill_in 'Title', with: 'Random title'
    fill_in 'Body', with: 'Sense child do state to defer mr of forty. Become latter but nor abroad wisdom waited. Was delivered gentleman acuteness but daughters. In as of whole as match asked. Pleasure exertion put add entrance distance drawings. In equally matters showing greatly it as. Want name any wise are able park when.'
    attach_file('article[picture]', Rails.root + 'spec/fixtures/image.jpg')
    select 'Ror Development', from: 'Category'
    click_button 'Create Article'
    expect(current_path).to eq('/pending')
    expect(page).to have_content('Random title')
    expect(page).to have_content('My pending posts')
    expect(page).to have_link('Edit')
    expect(page).to have_link('Delete')
  end
end

feature 'Moderator creates new article', js: true do

  before do
    moderator = create(:user, role: 2)
    category = create(:category)
    login moderator
  end

  scenario do
    click_link 'Create Post'
    fill_in 'Title', with: 'Random title'
    fill_in 'Body', with: 'Sense child do state to defer mr of forty. Become latter but nor abroad wisdom waited. Was delivered gentleman acuteness but daughters. In as of whole as match asked. Pleasure exertion put add entrance distance drawings. In equally matters showing greatly it as. Want name any wise are able park when.'
    attach_file('article[picture]', Rails.root + 'spec/fixtures/image.jpg')
    select 'Ror Development', from: 'Category'
    click_button 'Create Article'
    expect(current_path).to eq('/pending')
    expect(page).to have_content('Random title')
    expect(page).to have_content('Pending posts')
    expect(page).to have_link('Edit')
    expect(page).to have_link('Delete')
  end
end

feature 'Guest can\'t create new article', js: true do

  scenario do
    expect(page).to_not have_link('Create Post')
    expect(page).to_not have_link('My pending posts')
    expect(page).to_not have_link('Pending posts')
  end
end

feature 'User can\'t create new article', js: true do

  before do
    user = create(:user)
    login user
  end

  scenario do
    expect(page).to_not have_link('Create Post')
    expect(page).to_not have_link('My pending posts')
    expect(page).to_not have_link('Pending posts')
  end
end

feature 'Article with blank fields can\'t be created', js: true do

  before do
    member = create(:user, role: 1)
    category = create(:category)
    login member
  end

  scenario do
    click_link 'Create Post'
    click_button 'Create Article'
    expect(current_path).to eq('/new')
    expect(page).to have_content('Please review the problems below:')
    expect(page).to have_content('can\'t be blank')
    expect(page).to have_content('Picture can\'t be blank')
  end
end
