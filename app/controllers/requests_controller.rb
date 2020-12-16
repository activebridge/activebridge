class RequestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @success = verify_recaptcha(action: 'submit', minimum_score: 0.5, secret_key: Rails.application.secrets[:recaptcha_secret_key])
    if @success
      Request.confirm(attrs).deliver_later
      Request.notify(attrs).deliver_later
      respond_to do |f|
        f.html { redirect_to root_path }
        f.js { head 200 }
      end
    else
      respond_to do |f|
        f.js { head 401 }
      end
    end
  end

  private

  def attrs
    @attrs ||= params[:contact].as_json
  end
end
