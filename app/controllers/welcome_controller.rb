class WelcomeController < ApplicationController
  def index
    @users = User.all
  end
end
