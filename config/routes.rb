Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get ':page', to: 'welcome#index',
               constraints: { page: /(team|about|services|portfolio|testimonials|contact)/ },
               as: :page
  get 'expire_cache', to: 'welcome#expire_cache'
  get 'BingSiteAuth.xml' => 'welcome#bing_site_auth', format: 'xml', as: :BingSiteAuth

  resources :articles, constraints: { subdomain: 'blog' }, defaults: { format: :html }, path: '/' do
    collection do
      get 'category(/:category)', action: :index,
                                  as: :category,
                                  constraints: { category: /(#{Article.categories.keys.join('|')})/ }
      get 'page/:page', action: :index, as: 'page'
      scope ':type', constraints: { type: /(pending|done)/ } do
        get '/', action: :index, as: :index
      end
    end
  end

  post '/contact', to: 'requests#create', as: :contact

  root to: 'welcome#index'
end
