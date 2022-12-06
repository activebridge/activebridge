Rails.application.configure do
  config.cache_classes                              =  true
  config.eager_load                                 =  true
  config.consider_all_requests_local                =  false
  config.action_controller.perform_caching          =  true
  config.cache_store                                =  :memory_store, { size: 24.megabytes }
  config.public_file_server.enabled                 =  false
  config.assets.js_compressor                       =  :uglifier
  config.assets.compile                             =  true
  config.assets.digest                              =  true
  config.log_level                                  =  :debug
  config.i18n.fallbacks                             =  true
  config.active_support.deprecation                 =  :notify
  config.log_formatter                              =  ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration  =  false
  config.action_controller.default_url_options      =  { host: 'activebridge.org' }
  config.action_mailer.asset_host                   =  'https://activebridge.org'
  config.action_mailer.delivery_method              =  :smtp
  config.action_mailer.smtp_settings                =  {
    authentication: :plain,
    address: 'smtp.mailgun.org',
    port: 587,
    domain: 'active-bridge.com',
    user_name: ENV['mailgun_login'],
    password: ENV['mailgun_password'],
  }
end
