class ArticlesController < ApplicationController
  layout 'blog'

  expose(:articles_by_type) { Article.by_type((params[:type] || 'done'), current_user).by_category(params[:category]).order(created_at: :desc).paginate(page: params[:page], per_page: 5) }
  expose(:article, attributes: :article_params, finder: :find_by_slug)
  expose(:popular_articles) { Article.done.order(viewed: :desc).first(3) }
  expose(:categories)
  expose(:markdown) { Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true) }

  def show
    article.increment_viewed
  end

  def create
    if article.update(article_params)
      render :create
    else
      render :new
    end
  end

  def destroy
    article.destroy
    redirect_to index_articles_path(:pending)
  end

  alias update create

  private

  def article_params
    params.require(:article).permit!
  end
end
