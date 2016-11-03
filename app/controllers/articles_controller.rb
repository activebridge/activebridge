class ArticlesController < ApplicationController
  layout 'blog'

  expose(:articles) { Article.blog(params[:category], params[:page]) }
  expose(:article, find_by: :slug)
  expose(:popular_articles) { Article.done.order(viewed: :desc).first(3) }

  def show
    article.increment_viewed
  end

  private

  def article_params
    params.require(:article).permit(:title, :category, :picture, :body, :member_id)
  end
end
