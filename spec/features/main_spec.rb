require 'rails_helper'

RSpec.feature 'Main', type: :feature do
  let!(:member) { create(:member) }

  scenario 'Visit main page' do
    visit root_url
    expect(page).to have_content('Active Bridge')
  end

  scenario 'Visit services page' do
    visit page_url(:services)
    expect(page).to have_content('Web application development')
  end

  scenario 'Visit portfolio page' do
    visit page_url(:portfolio)
    expect(page).to have_css('.portfolio_testimonials')
  end

  scenario 'Visit how_we_work page' do
    visit page_url('how-we-work')
    expect(page).to have_css('.cooperation_models_cards')
    expect(page).to have_content('Active Bridge')
  end

end
