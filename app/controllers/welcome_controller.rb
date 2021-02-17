class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :filter_bots
  caches_action :index,
                cache_path: proc { request.variant&.first&.to_s || "#{params[:page] || :index}/#{request.format}" }

  def index
    @page = params[:page] || '/'
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

  private

  def filter_bots
    redirect_to 'https://www.google.com/' if request.is_crawler? && request.user_agent.exclude?("SemrushBot")
  end
end
