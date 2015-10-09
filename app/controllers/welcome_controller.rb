class WelcomeController < ApplicationController
  def index
    @users = User.all
    @portfolios = Portfolio.all
  end
end
