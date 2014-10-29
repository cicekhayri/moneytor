Rails.application.routes.draw do

  root 'welcome#index'
  
  resources :users
  resources :purchases
  resources :categories
  resources :sessions, only: [:create]

  get 'admin_index', to: "admin#index", as: 'admin_index'

  get 'previous', to: "welcome#index"
  get 'next', to: "welcome#index"
  get 'show_by_category', to: 'welcome#show_by_category'
  
  get 'login', to: "sessions#new"
  get 'logout', to: "sessions#destroy" 
  get 'signup', to: "users#new", as: "signup"
 
end
