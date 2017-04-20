require 'rails_helper'

include ActiveJob::TestHelper

RSpec.feature 'Mailer', type: :feature do
  let(:info) {{
    name: 'Alex',
    email: 'valid_email@active-bridge.com',
    message: 'Active Bridge - the best company ever!'
  }}
  let(:ab_email) { 'contact@active-bridge.com' }

  scenario 'send emails via contact form' do
    visit page_url(:contact)
    expect(page).to have_content(ab_email)

    fill_in 'Your name', with: info[:name]
    fill_in 'Your email', with: info[:email]
    fill_in 'Text message', with: info[:message]

    click_button 'submit'

    open_email ab_email
    expect(current_email.body).to have_content(info[:message])
  end
end
