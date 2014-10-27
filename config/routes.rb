Rails.application.routes.draw do

  root 'welcome#index'
  
  resources :users
  resources :purchases
  resources :categories
  resources :sessions, only: [:create]


  get 'previous_month', to: "welcome#index"
  get 'next_month', to: "welcome#index"
  
  get 'login', to: "sessions#new"
  get 'logout', to: "sessions#destroy" 
  get 'signup', to: "users#new", as: "signup"
 
end
