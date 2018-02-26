require 'rails_helper'

RSpec.describe DownloadController, type: :controller do
  let!(:users) { FactoryGirl.create_list(:user, 2) }
  let(:date) { Date.today }
  let!(:incoice1) { FactoryGirl.create(:invoice, user_id: User.first.id, date: date) }
  let!(:incoice2) { FactoryGirl.create(:invoice, user_id: User.second.id, date: date) }

  describe "GET #invoices" do
    subject { get :invoices, date: date, format: :xlsx }
    #binding.pry
    #it { binding.pry }
    it { is_expected.to have_http_status :ok }
    it { is_expected.to render_template 'invoices.xlsx.axlsx' }
    it { expect(subject.content_type).to include 'application/xlsx' }
  end
end
