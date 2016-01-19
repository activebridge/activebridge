class SessionsController < ApplicationController

  expose(:user)

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    user.check_member
    session[:user_id] = user.id
    redirect_to articles_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to articles_path
  end
end
