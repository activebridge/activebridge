class ArticlesController < ApplicationController
  layout 'blog'

  before_filter :moderator_only, only: [:edit, :update, :destroy]
  before_filter :member_and_moderator_only, only: [:new, :create]

  expose(:articles) { |default| default.by_category(params[:category]).order(created_at: :desc).paginate(page: params[:page], per_page: 5) }
  expose(:article, attributes: :article_params, finder: :find_by_slug)
  expose(:popular_articles) { Article.done.order(viewed: :desc).first(3) }
  expose(:categories)

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

  def update
    if article.save
      redirect_to article
    else
      render :edit
    end
  end

  private

  def moderator_only
    unless current_user.moderator? && article.pending?
      redirect_to articles_path
    end
  end

  def member_and_moderator_only
    unless current_user.member? || current_user.moderator?
      redirect_to articles_path
    end
  end

  def article_params
    params.require(:article).permit!
  end
end
