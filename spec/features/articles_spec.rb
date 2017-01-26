require 'rails_helper'

RSpec.feature 'Articles page', type: :feature do
  let(:member) { create(:member) }
  let!(:article) { create(:article, member: member) }

  before(:each) { change_host 'blog.lvh.me:3000' }

  scenario do
    visit root_path
    expect(page).to have_content('Active::Bridge')
    expect(page).to have_content('Popular posts')
    expect(page).to have_content('All Posts')
    expect(page).to have_content('1 item')
    expect(page).to have_content('Alex')
    expect(page).to have_content('Random title')
  end
end
