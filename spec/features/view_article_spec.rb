require 'spec_helper'

feature 'Guest views done article', js: true do

  before do
    user = create(:user)
    category = create(:category)
    article = create(:article, review_status: 1)
  end

  scenario do
    visit root_path
    click_link 'Random title', match: :first
    expect(page).to have_content('Random title')
    expect(page).to have_content('Sense child do state to defer mr of forty.')
    expect(current_path).to eq('/random-title')
  end
end

feature 'User views done article', js: true do

  before do
    user = create(:user)
    category = create(:category)
    article = create(:article, review_status: 1)
    login user
  end

  scenario do
    click_link 'Random title', match: :first
    expect(page).to have_content('Random title')
    expect(page).to have_content('Sense child do state to defer mr of forty.')
    expect(current_path).to eq('/random-title')
  end
end

feature 'Member views done article', js: true do

  before do
    member = create(:user)
    category = create(:category)
    article = create(:article, review_status: 1)
    login member
  end

  scenario do
    click_link 'Random title', match: :first
    expect(page).to have_content('Random title')
    expect(page).to have_content('Sense child do state to defer mr of forty.')
    expect(current_path).to eq('/random-title')
  end
end

feature 'Member views pending article', js: true do

  before do
    member = create(:user, role: 1)
    category = create(:category)
    article = create(:article, review_status: 0)
    login member
  end

  scenario do
    click_link 'My pending posts'
    expect(page).to have_link('Edit')
    expect(page).to have_link('Delete')
    click_link 'Random title', match: :first
    expect(page).to have_content('Random title')
    expect(page).to have_content('Sense child do state to defer mr of forty.')
    expect(current_path).to eq('/random-title')
  end
end

feature 'Moderator views done article', js: true do

  before do
    moderator = create(:user, role: 2)
    category = create(:category)
    article = create(:article, review_status: 1)
    login moderator
  end

  scenario do
    click_link 'Random title', match: :first
    expect(page).to have_content('Random title')
    expect(page).to have_content('Sense child do state to defer mr of forty.')
    expect(current_path).to eq('/random-title')
  end
end

feature 'Moderator views pending article', js: true do

  before do
    moderator = create(:user, role: 2)
    category = create(:category)
    article = create(:article, review_status: 0)
    login moderator
  end

  scenario do
    click_link 'Pending posts'
    expect(page).to have_link('Edit')
    expect(page).to have_link('Delete')
    click_link 'Random title', match: :first
    expect(page).to have_content('Random title')
    expect(page).to have_content('Sense child do state to defer mr of forty.')
    expect(current_path).to eq('/random-title')
  end
end
