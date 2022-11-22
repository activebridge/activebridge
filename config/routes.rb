Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get ':page', to: 'welcome#index',
               constraints: { page: /(services|reviews|contact|expertise|about|solutions|testimonials|faq|privacy-policy)/ },
               as: :page
  get 'expire_cache', to: 'welcome#expire_cache'
  get 'BingSiteAuth.xml' => 'welcome#bing_site_auth', format: 'xml', as: :BingSiteAuth

  get '/about', to: 'welcome#index'

  resources :articles, defaults: { format: :html }, path: 'blog' do
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
