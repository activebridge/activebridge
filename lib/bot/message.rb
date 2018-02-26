# frozen_string_literal: true
module Bot
  class Message
    attr_accessor :text, :channel_id, :hours, :user_name, :company_id, :customer_name

    def initialize(params = {})
      @text = params[:text]
      @channel_id = params[:channel_id]

      @hours = params[:hours]
      @user_name = params[:user_name]
      @company_id = params[:company_id]
      @customer_name = params[:customer_name]
    end
  end
end
