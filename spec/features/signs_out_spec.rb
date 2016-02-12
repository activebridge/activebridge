require 'spec_helper'

feature 'User signs out', js: true do

  before do
    user = create(:user)
    login user
  end

  scenario do
    click_link ('Log out')
    expect(page).to have_link('Sign in')
    expect(page).to_not have_link('Log out')
  end
end

feature 'Member signs out', js: true do

  before do
    member = create(:user, role: 1)
    login member
  end

  scenario do
    click_link ('Log out')
    expect(page).to have_link('Sign in')
    expect(page).to_not have_link('Log out')
  end
end

feature 'Moderator signs out', js: true do

  before do
    moderator = create(:user, role: 2)
    login moderator
  end

  scenario do
    click_link ('Log out')
    expect(page).to have_link('Sign in')
    expect(page).to_not have_link('Log out')
  end
end
