require 'rails_helper'

include ActiveJob::TestHelper

ActiveJob::Base.queue_adapter = :test

RSpec.feature 'Mailer', type: :feature do
  let(:message) { 'Active Bridge - the best company ever!' }

  before { clear_enqueued_jobs }

  scenario 'send emails via contact form' do
    visit page_url(:contact)
    expect(page).to have_content('contact@active-bridge.com')

    fill_in 'Your name', with: 'Alex'
    fill_in 'Your email', with: 'valid_email@active-bridge.com'
    fill_in 'Text message', with: message
    expect { click_button 'submit'}.to change { enqueued_jobs.size }.by(2)

    contact_mail = perform_enqueued_jobs { ActionMailer::DeliveryJob.perform_now(*enqueued_jobs.first[:args]) }
    user_mail    = perform_enqueued_jobs { ActionMailer::DeliveryJob.perform_now(*enqueued_jobs.second[:args]) }

    expect(contact_mail.body).to have_content('We will look over your message and get back to you as soon as possible')
    expect(user_mail.body).to have_content(message)
  end
end
