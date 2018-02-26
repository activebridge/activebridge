class SlacksController < ActionController::API
  def default
    render json: ('Welcome to Active Accounting Bot.').to_json, status: 200
  end

  def check_project
    head 200
  end
end
