Recaptcha.configure do |config|
  config.site_key   = Rails.application.secrets[:recaptcha_site_key]
  config.secret_key = ENV["RECAPTCHA_SECRET_KEY"]
end
