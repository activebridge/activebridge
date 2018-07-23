module AuthHelper
  def http_login
    user = ENV['USER']
    pw = ENV['SECRET']
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end
end
