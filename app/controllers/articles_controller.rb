class ArticlesController < ApplicationController
  layout 'blog'

  expose(:articles)
  expose(:article)

  def create
    article.save
    respond_to(article)
  end

  def update
    article.save
    respond_to(article)
  end

  def destroy
    article.destroy
    respond_to {}
  end
end
