class SubscribersController < ApplicationController
  expose(:subscriber)
  def create
    @subscriber = Subscriber.new(subscriber_params)
    @subscriber.save
    SubscriptionMailer.welcome(@subscriber.email).deliver_later
    redirect_to root_path
  end

  def show
    subscriber.update(active: false)
    redirect_to root_path
  end

  private

  def subscriber_params
    params.require(:subscriber).permit!
  end
end
