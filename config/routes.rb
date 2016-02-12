Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get ':page', to: 'welcome#index',
               constraints: { page: /(team|about|services|portfolio)/ }
  get 'expire_cache', to: 'welcome#expire_cache'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'auth/:provider/callback', to: 'sessions#create'

  resource :team, only: :show
  resources :articles, constraints: { subdomain: 'blog' }, path: '/' do
    collection do
      get 'category/:category', action: :index, as: 'category'
      get 'page/:page', action: :index, as: 'page'
      get '/auth/google_oauth2', as: 'google'
      scope ':type', constraints: { type: /(pending|done)/ } do
        get '/', action: :index, as: :index
      end
    end
  end

  root to: 'welcome#index'
end
