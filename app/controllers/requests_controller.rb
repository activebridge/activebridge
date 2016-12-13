class RequestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Request.confirm(params[:contact]).deliver_later
    Request.notify(params[:contact]).deliver_later
    respond_to do |f|
      f.html { redirect_to root_path }
      f.js { head 200 }
    end
  end
end
