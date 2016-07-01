Rails.application.configure do
  config.cache_classes                          = false
  config.eager_load                             = false
  config.consider_all_requests_local            = true
  config.action_controller.perform_caching      = false
  config.cache_store                            = :memory_store, { size: 24.megabytes }
  config.action_mailer.raise_delivery_errors    = false
  config.active_support.deprecation             = :log
  config.active_record.migration_error          = :page_load
  config.assets.debug                           = true
  config.assets.digest                          = true
  config.assets.raise_runtime_errors            = true
  config.action_mailer.asset_host               = 'http://lvh.me:3000'
  config.action_mailer.default_url_options      = { host: 'lvh.me:3000' }
  # config.action_mailer.delivery_method          = :letter_opener
  config.action_mailer.delivery_method              = :mailgun
  config.action_mailer.mailgun_settings             = {
    api_key: 'key-6ad371c7e56cc40ef057014e089766d0',
    domain: 'sandboxe7e942fc95b747f6a5f4409f81adf58c.mailgun.org'
  }
end
