class ArticlesController < ApplicationController
  layout 'blog'

  def index
    @done_articles = Article.done
  end
end
