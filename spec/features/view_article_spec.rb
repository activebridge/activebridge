require 'spec_helper'

feature 'View article', js: true do
  let(:member) { create(:member) }
  let(:article) { create(:article, member: member) }

  scenario do
    pending
    click_link 'Random title', match: :first
    expect(page).to have_content('Random title')
    expect(page).to have_content('Sense child do state to defer mr of forty.')
    expect(current_path).to eq('/random-title')
  end
end
