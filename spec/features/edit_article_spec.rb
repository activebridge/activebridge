require 'spec_helper'

feature 'Member edits an article', js: true do

  before do
    member = create(:user, role: 1)
    category = create(:category)
    article = create(:article)
    login member
  end

  scenario do
    click_link 'My pending posts'
    click_link 'Edit'
    expect(current_path).to eq('/random-title/edit')
    fill_in 'Title', with: 'New title'
    fill_in 'Body', with: 'Ladies others the six desire age. Bred am soon park past read by lain. As excuse eldest no moment. An delight beloved up garrets am cottage private. The far attachment discovered celebrated decisively surrounded for and. Sir new the particular frequently indulgence excellence how. Wishing an if he sixteen'
    click_button 'Update Article'
    expect(page).to have_content('New title')
    expect(page).to have_content('Ladies others the six desire age. Bred am soon park past read by lain')
  end
end

feature 'Moderator edits an article', js: true do

  before do
    moderator = create(:user, role: 2)
    category = create(:category)
    article = create(:article)
    login moderator
  end

  scenario do
    click_link 'Pending posts'
    click_link 'Edit'
    expect(current_path).to eq('/random-title/edit')
    fill_in 'Title', with: 'New title'
    fill_in 'Body', with: 'Ladies others the six desire age. Bred am soon park past read by lain. As excuse eldest no moment. An delight beloved up garrets am cottage private. The far attachment discovered celebrated decisively surrounded for and. Sir new the particular frequently indulgence excellence how. Wishing an if he sixteen'
    click_button 'Update Article'
    expect(page).to have_content('New title')
    expect(page).to have_content('Ladies others the six desire age. Bred am soon park past read by lain')
  end
end

feature 'Member can\'t edit done article', js: true do

  before do
    member = create(:user, role: 1)
    category = create(:category)
    article = create(:article, review_status: 1)
    login member
  end

  scenario do
    visit '/random-title/edit'
    expect(page).to have_content('You are not authorized to access this page.')
  end
end
