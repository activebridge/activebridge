require 'rails_helper'

RSpec.feature 'Articles page', type: :feature do
  let!(:ror_article) { create(:article, title: 'ror-article', category: :ror) }
  let!(:team_article) { create(:article, title: 'team-article', category: :team) }

  before(:each) { change_host 'blog.lvh.me:3000' }

  after(:each) { Capybara.app_host = nil }

  scenario do
    visit root_path
    expect(page).to have_content('Active::Bridge')
    expect(page).to have_content('All Posts')
    expect(page).to have_content('1 item')
    expect(page).to have_content('Alex')
    expect(page).to have_content(ror_article.title)
    expect(page).to_not have_content(team_article.title)
  end

  scenario do
    visit category_articles_path(category: :team)
    expect(page).to have_content(team_article.title)
  end
end
