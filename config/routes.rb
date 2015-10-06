Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: 'welcome#index'
end
