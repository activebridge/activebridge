class WelcomeController < ApplicationController
  before_action :set_variant

  def index
    @members = Member.order(priority: :asc)
    @projects = Project.order(priority: :asc)
  end

  def expire_cache
    Rails.cache.clear
    redirect_to '/admin'
  end
end
