require 'rails_helper'

RSpec.feature 'Main', type: :feature do
  let!(:member) { create(:member) }

  scenario 'Visit main page' do
    visit root_url
    expect(page).to have_content('Active Bridge')
  end

  scenario 'Visit about page' do
    visit page_url(:about)
    expect(page).to have_content('Active Bridge')
  end

  scenario 'Visit services page' do
    visit page_url(:services)
    expect(page).to have_content('Services')
  end

  scenario 'Visit testimonials page' do
    visit page_url(:testimonials)
    expect(page).to have_content('Testimonials')
  end

  scenario 'Visit portfolio page' do
    visit page_url(:portfolio)
    expect(page).to have_content('Portfolio')
  end

  scenario 'Visit contact page' do
    visit page_url(:contact)
    expect(page).to have_content('contact@active-bridge.com')
  end

  scenario 'Visit js pages', js: true do
    visit root_path
    find('#team', visible: false).trigger :click
    expect(page).to have_content('Active Bridge')
    find('#about', visible: false).trigger :click
    expect(page).to have_content('TESTIMONIALS')
    find('#services', visible: false).trigger :click
    expect(page).to have_content('SERVICES')
    find('#testimonials', visible: false).trigger :click
    expect(page).to have_content('TEAM')
    find('#portfolio', visible: false).trigger :click
    expect(page).to have_content('PORTFOLIO')
    find('#contact', visible: false).trigger :click
    expect(page).to have_content('contact@active-bridge.com')
    find('#lazy_close', visible: false).trigger :click
    expect(page).not_to have_selector('#lazybox')
  end
end
