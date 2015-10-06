Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: 'welcome#index'

  namespace :admin do
    resources :users
  end
end
