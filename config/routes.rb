Rails.application.routes.draw do
  resources :subscribers
  ActiveAdmin.routes(self)
  get ':page', to: 'welcome#index',
               constraints: { page: /(team|about|services|portfolio|testimonials)/ },
               as: :page
  get 'expire_cache', to: 'welcome#expire_cache'

  resource :team, only: :show
  resources :articles, constraints: { subdomain: 'blog' }, path: '/' do
    collection do
      get 'category/:category', action: :index, as: 'category'
      get 'page/:page', action: :index, as: 'page'
      scope ':type', constraints: { type: /(pending|done)/ } do
        get '/', action: :index, as: :index
      end
    end
  end

  root to: 'welcome#index'
end
