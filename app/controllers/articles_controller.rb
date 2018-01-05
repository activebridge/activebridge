class ArticlesController < ApplicationController
  layout 'blog'
  caches_action :index, cache_path: proc { "#{params[:category] || 'all'}-#{articles.first&.cache_key}" }
  caches_action :show, cache_path: proc { article.cache_key }
  respond_to :js

  private

  def articles
    @articles ||= Article.blog(params[:category], params[:page])
  end
  helper_method :articles

  def article
    @article ||= Article.friendly.find(params[:id])
  end
  helper_method :article

  def recommended_articles
    @recommended_articles ||= Article.by_category(article.category).recommended(article)
  end
  helper_method :recommended_articles
end
