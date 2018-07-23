Rails.application.configure do
  config.cache_classes                               =  true
  config.eager_load                                  =  false
  config.public_file_server.enabled                  =  true
  config.public_file_server.headers                  =  { 'Cache-Control' => 'public,  max-age=3600' }
  config.consider_all_requests_local                 =  true
  config.action_controller.perform_caching           =  false
  config.action_dispatch.show_exceptions             =  false
  config.action_controller.allow_forgery_protection  =  false
  config.action_mailer.delivery_method               =  :test
  config.active_support.test_order                   =  :random
  config.active_support.deprecation                  =  :stderr
  config.active_job.queue_adapter = :inline

  config.before_configuration do
    env_file = File.join(Rails.root, 'config', 'local_env.yml')
    YAML.load(File.open(env_file)).each do |key, value|
      ENV[key.to_s] = value
    end if File.exists?(env_file)
  end
end
