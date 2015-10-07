Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get ':page', to: 'welcome#index', constraints: { page: /(team|about)/, format: 'html' }
  resource :team, only: :show
  root to: 'welcome#index'
end
