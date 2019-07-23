
Rails.application.routes.draw do
  resources :comments
  resources :users
  get 'welcome/home', to: 'welcome#home'
  resources :articles
end