class WelcomeController < ApplicationController
  def index
    @members = Member.all
    @projects = Project.all
  end

  def expire_cache
    Rails.cache.clear
    redirect_to '/admin'
  end
end
