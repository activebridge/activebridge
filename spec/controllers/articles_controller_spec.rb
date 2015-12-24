require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns all articles" do
      get :index
      expect(controller.articles).to eq(Article.all)
    end

    it "returns done articles" do
      get :index
      expect(controller.articles.done).to eq(Article.done)
    end

    it "returns pending articles" do
      get :index
      expect(controller.articles.pending).to eq(Article.pending)
    end
  end

end
