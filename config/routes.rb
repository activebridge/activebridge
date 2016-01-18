Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get ':page', to: 'welcome#index',
               constraints: { page: /(team|about|services|portfolio)/ }
  get 'expire_cache', to: 'welcome#expire_cache'
  get 'blog/category/:category', to: 'articles#index', as: 'category'
  get 'blog/page/:page', to: 'articles#index', as: 'page'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resource :team, only: :show
  resources :articles, path: 'blog'

  root to: 'welcome#index'
end
