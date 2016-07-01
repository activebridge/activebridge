class SubscriptionMailer < ActionMailer::Base
  default from: 'ActiveBridge <voloshyn@active-bridge.com>'

  def new_article(subscriber, article)
    @article = article
    @subscriber = subscriber
    mail(to: subscriber.email, subject: @article.title)
  end
end
