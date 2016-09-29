class RequestsController < ApplicationController
  def create
    head 200
    Request.confirm(params[:contact]).deliver_later
    Request.notify(params[:contact]).deliver_later
  end
end
