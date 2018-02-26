require 'rails_helper'

RSpec.describe SlacksController, type: :controller do
  describe "GET #default" do
    subject { get :default, format: :json }

    it { is_expected.to have_http_status 200 }
    it { expect(subject.header['Content-Type']).to include 'application/json' }
    it { expect(subject.body).to include 'Welcome to Active Accounting Bot.' }
  end

  describe "POST #check_project" do
    subject { post :check_project, params: { message: 'Test dats'  }, format: :json }

    it { is_expected.to have_http_status 200 }
    it { expect(subject.header['Content-Type']).to include 'application/json' }
  end
end
