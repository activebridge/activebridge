class WelcomeController < ApplicationController
layout :set_layout

  def index
    @members = Member.order(priority: :asc)
    @projects = Project.order(priority: :asc)
  end

  def expire_cache
    Rails.cache.clear
    redirect_to '/admin'
  end
end
