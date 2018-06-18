Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  get 'welcome/about'
  get 'welcome/about/about', to: 'welcome#about'
  resources :welcome
end
