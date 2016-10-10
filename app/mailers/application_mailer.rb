class ApplicationMailer < ActionMailer::Base
  include Roadie::Rails::Automatic

  default from: 'contact@active-bridge.com'
  layout 'mailer'
end
