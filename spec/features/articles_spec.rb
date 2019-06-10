require 'rails_helper'

RSpec.feature 'Articles page', type: :feature do
  let!(:ror_article) { create(:article, title: 'ror-development-article', category: :'web-development') }
  let!(:insights_article) { create(:article, title: 'insights-article', category: :insights) }

  scenario do
    visit articles_path
    expect(page).to have_content('Active Bridge')
    expect(page).to have_content('All Posts')
    expect(page).to have_content('1 item')
    expect(page).to have_content('Alex')
    expect(page).to have_content(ror_article.title)
    expect(page).to_not have_content(insights_article.title)
  end

  scenario do
    visit category_articles_path(category: :insights)
    expect(page).to have_content(insights_article.title)
  end
end
