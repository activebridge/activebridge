class WelcomeController < ApplicationController
  def index
    @members = Member.all
    @projects = Project.all
  end
end
