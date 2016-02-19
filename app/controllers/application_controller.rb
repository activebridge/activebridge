class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  expose(:current_user) { session[:user_id] ? User.find(session[:user_id]) : nil }

  # rescue_from CanCan::AccessDenied do |exception|
    # redirect_to articles_path, alert: exception.message
  # end

  protected

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.secrets[:admin_username] && password == Rails.application.secrets[:admin_password]
    end
  end

  def set_layout
    if request.user_agent =~ /Android|iPad|iPhone|Mobile/
      "mobile"
    else
      "application"
    end
  end
end
