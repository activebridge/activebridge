require 'spec_helper'

feature 'Member deletes an article', js: true do

  before do
    member = create(:user, role: 1)
    category = create(:category)
    article = create(:article)
    login member
  end

  scenario do
    click_link 'My pending posts'
    expect(page).to have_link('Random title')
    click_link 'Delete'
    expect(page).to_not have_link('Random title')
  end
end

feature 'Moderator deletes an article', js: true do

  before do
    moderator = create(:user, role: 2)
    category = create(:category)
    article = create(:article)
    login moderator
  end

  scenario do
    click_link 'Pending posts'
    expect(page).to have_link('Random title')
    click_link 'Delete'
    expect(page).to_not have_link('Random title')
  end
end
