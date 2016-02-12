require 'spec_helper'

feature 'Guest signs in', js: true do

  scenario do
    expect(page).to_not have_link('Log out')
    expect(page).to_not have_content('User')
    expect(page).to_not have_content('Member')
    expect(page).to_not have_content('Moderator')
  end
end

feature 'User signs in', js: true do

  before do
    @user = create(:user)
    login @user
  end

  scenario do
    expect(page).to have_content("#{@user.full_name}")
    expect(page).to have_content('User')
    expect(page).to have_link('Log out')
  end
end

feature 'Member signs in', js: true do

  before do
    @member = create(:user, role: 1)
    login @member
  end

  scenario do
    expect(page).to have_content("#{@member.full_name}")
    expect(page).to have_content('Member')
    expect(page).to have_link('Log out')
    expect(page).to have_link('Create Post')
    expect(page).to have_link('My pending posts')
  end
end

feature 'Moderator signs in', js: true do

  before do
    @moderator = create(:user, role: 2)
    login @moderator
  end

  scenario do
    expect(page).to have_content("#{@moderator.full_name}")
    expect(page).to have_content('Moderator')
    expect(page).to have_link('Log out')
    expect(page).to have_link('Create Post')
    expect(page).to have_link('Pending posts')
  end
end
