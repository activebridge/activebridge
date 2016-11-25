class ArticlesController < ApplicationController
  layout 'blog'
  caches_action :index, cache_path: proc { "#{params[:category]}#{articles.first&.cache_key}" }
  caches_action :show, cache_path: proc { article.cache_key }

  def index
    params[:category] ||= 'All Posts'
  end

  private

  def articles
    @articles ||= Article.blog(params[:category], params[:page])
  end
  helper_method :articles

  def article
    @article ||= Article.friendly.find(params[:id])
  end
  helper_method :article

  def popular_articles
    @popular_articles ||= Article.done.includes(:member).order(viewed: :desc).first(3)
  end
  helper_method :popular_articles
end
