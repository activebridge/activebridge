class WelcomeController < ApplicationController
  def index
    @members = Member.order(priority: :asc)
    @projects = Project.order(priority: :asc)
  end

  def expire_cache
    Rails.cache.clear
    redirect_to '/admin'
  end
end
