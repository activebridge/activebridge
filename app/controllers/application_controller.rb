class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  expose(:current_user) { User.find(session[:user_id]) if session[:user_id] }

  protected

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def require_user
    return if current_user
    raise ActionController::RoutingError.new('Not Found'), 'Not Found'
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.secrets[:admin_username] && password == Rails.application.secrets[:admin_password]
    end
  end

  def set_variant
    request.variant = :mobile if mobile?
  end

  def mobile?
    browser.mobile? || browser.tablet?
  end
end
