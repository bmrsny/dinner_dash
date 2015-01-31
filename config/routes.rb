Rails.application.routes.draw do
  get "/register", to: "users#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :items
  resources :cart

  resources :categories
  resources :orders_items
  root "welcome#index"

  resources :users do
    resources :orders
  end

  namespace :admin do
    resources :categories
    resources :items
    resources :orders
  end
end
