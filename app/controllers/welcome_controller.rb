class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_variant
  caches_action :index,
                cache_path: proc { request.variant&.first&.to_s || "#{params[:page] || :index}/#{request.format}" }

  def index
    @members = Member.order(priority: :asc)
    @projects = Project.order(priority: :asc)
    @page = params[:page]
    render params[:page]
  end

  def bing_site_auth
    respond_to do |format|
      format.xml
    end
  end

  def expire_cache
    Rails.cache.clear
    redirect_to '/admin'
  end
end
