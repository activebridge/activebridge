require 'rails_helper'

RSpec.feature 'Main', type: :feature do
  scenario 'Visit main page' do
    visit root_url
    expect(page).to have_content('active-bridge')
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
    find('#team').trigger :click
    expect(page).to have_content('Active Bridge')
    find('#about').trigger :click
    expect(page).to have_content('TESTIMONIALS')
    find('#services').trigger :click
    expect(page).to have_content('SERVICES')
    find('#testimonials').trigger :click
    expect(page).to have_content('TEAM')
    find('#portfolio').trigger :click
    expect(page).to have_content('PORTFOLIO')
    find('#contact').trigger :click
    expect(page).to have_content('contact@active-bridge.com')
  end
end
