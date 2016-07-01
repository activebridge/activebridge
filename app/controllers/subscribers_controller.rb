class SubscribersController < ApplicationController
  expose(:subscriber)
  def create
    @subscriber = Subscriber.new(subscriber_params)
    @subscriber.save
    SubscriptionMailer.welcome(@subscriber.email).deliver_later
    redirect_to root_path
  end

  def show
    return redirect_to root_path unless subscriber.active?
    subscriber.update(active: false)
    SubscriptionMailer.goodbye(@subscriber.email).deliver_later
    redirect_to root_path
  end

  private

  def subscriber_params
    params.require(:subscriber).permit!
  end
end
