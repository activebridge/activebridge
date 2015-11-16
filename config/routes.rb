Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get ':page', to: 'welcome#index',
               constraints: { page: /(team|about|services|portfolio)/ }
  resource :team, only: :show
  root to: 'welcome#index'
end
