Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get ':page', to: 'welcome#index',
               constraints: { page: /(team|about|services|portfolio)/ }
  get '/expire_cache', to: 'welcome#expire_cache'
  resource :team, only: :show
  root to: 'welcome#index'
end
