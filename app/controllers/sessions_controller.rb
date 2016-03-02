class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to articles_path
  end

  def destroy
    session[:user_id] = nil
    redirect_via_turbolinks_to articles_path
  end
end
