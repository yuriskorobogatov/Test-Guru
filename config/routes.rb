Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  get 'welcome/about'
  get 'welcome/about/author', to: 'welcome#author'
  resources :welcome
end
