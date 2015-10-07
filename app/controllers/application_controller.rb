class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.secrets[:admin_username] && password == Rails.application.secrets[:admin_password]
    end
  end
end
