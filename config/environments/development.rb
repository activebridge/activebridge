Rails.application.configure do
  config.eager_load                             =  false
  config.consider_all_requests_local            =  true
  config.action_controller.perform_caching      =  false
  config.cache_store                            =  :memory_store, { size: 64.megabytes }
  config.action_mailer.raise_delivery_errors    =  false
  config.active_support.deprecation             =  :log
  config.active_record.migration_error          =  :page_load
  config.assets.debug                           =  true
  config.assets.digest                          =  true
  config.assets.raise_runtime_errors            =  true
  config.action_mailer.delivery_method          =  :letter_opener
  config.action_controller.default_url_options  =  { host: 'localhost:3000' }
  config.action_mailer.asset_host = 'localhost:3000'
end
