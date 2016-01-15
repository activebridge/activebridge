class ArticlesController < ApplicationController
  layout 'blog'

  expose(:articles) { |default| default.order(created_at: :desc).by_category(params[:category]).paginate(:page => params[:page], :per_page => 5) }
  expose(:article, attributes: :article_params, finder: :find_by_slug)
  expose(:categories)
  expose(:popular_articles) { Article.done.order(viewed: :desc).first(3) }

  def show
    article.increment! :viewed
  end

  def create
    if article.save
      redirect_to article
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit!
  end
end
