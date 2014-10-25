Rails.application.routes.draw do

  root 'welcome#index'
  
  resources :users
  resources :recipes
  resources :categories
  resources :sessions, only: [:create]


  get 'login', to: "sessions#new"
  get 'logout', to: "sessions#destroy" 
  get 'signup', to: "users#new", as: "signup"
 
end
