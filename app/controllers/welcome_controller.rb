class WelcomeController < ApplicationController
  WHITELISTED_BOTS = ['Googlebot-Image',
    'Googlebot',
    'APIs-Google',
    'Googlebot-Video',
    'Google-Read-Aloud',
    'googleweblight',
    'Storebot-Google',
    'Google Favicon',
    'SemrushBot',
    'Bingbot',
    'Slurp',
    'ia_archiver']
  GOOGLE = 'https://www.google.com/'
  skip_before_action :verify_authenticity_token
  # before_action :filter_bots
  caches_action :index,
                cache_path: proc { request.variant&.first&.to_s || "#{params[:page] || :index}/#{request.format}" }

  def index
    @page = params[:page] || '/'
    @subitem = params[:subitem] || ''
    if params[:subitem]
      render ['welcome', params[:page], params[:subitem]].join('/')
    else
      render params[:page]
    end
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
    redirect_to GOOGLE if request.is_crawler? && WHITELISTED_BOTS.exclude?(request.user_agent)
  end
end
