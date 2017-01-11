Rails.application.configure do
  config.serviceworker.routes.draw do
    match '/serviceworker.js'
  end
end
