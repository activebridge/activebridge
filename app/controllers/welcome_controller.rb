class WelcomeController < ApplicationController
  before_action :set_variant
  caches_action :index,
                cache_path: proc { request.variant&.first&.to_s || "#{params[:page] || :index}/#{request.format}" }

  def index
    @members = Member.order(priority: :asc)
    @projects = Project.order(priority: :asc)
  end

  def expire_cache
    Rails.cache.clear
    redirect_to '/admin'
  end
end
