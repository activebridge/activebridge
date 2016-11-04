class ArticlesController < ApplicationController
  layout 'blog'

  def show
    article.increment_viewed
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
    @popular_articles ||= Article.done.order(viewed: :desc).first(3)
  end
  helper_method :popular_articles
end
