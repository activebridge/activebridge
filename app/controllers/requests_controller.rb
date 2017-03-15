class RequestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Request.confirm(attrs).deliver_later
    Request.notify(attrs).deliver_later
    respond_to do |f|
      f.html { redirect_to root_path }
      f.js { head 200 }
    end
  end

  private

  def attrs
    @attrs ||= params[:contact].as_json
  end
end
