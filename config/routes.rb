Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get ':page', to: 'welcome#index',
               constraints: { page: /(services|reviews|contacts|expertise|about|solutions|testimonials|faq|privacy-policy)/ },
               as: :page
  get '/:page/:subitem', to: 'welcome#index', as: :page_subitem
  get 'expire_cache', to: 'welcome#expire_cache'
  get 'BingSiteAuth.xml' => 'welcome#bing_site_auth', format: 'xml', as: :BingSiteAuth

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

  post '/contacts', to: 'requests#create', as: :contacts

  root to: 'welcome#index'
end
