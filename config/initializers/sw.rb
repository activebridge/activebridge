Rails.application.configure do
  config.serviceworker.routes.draw do
    match '/sw.js'
  end
end
