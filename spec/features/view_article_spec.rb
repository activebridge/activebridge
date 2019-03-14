require 'rails_helper'

RSpec.feature 'View article', type: :feature do
  let(:member) { create(:member) }
  let!(:article) { create(:article, member: member) }

  scenario do
    visit articles_path
    click_link 'Read more', match: :first
    expect(page).to have_content('Random title')
    expect(page).to have_content(article.body)
    expect(current_path).to eq('/blog/random-title')
  end
end
