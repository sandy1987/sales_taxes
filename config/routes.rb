Rails.application.routes.draw do
  root to: "products#index"
  devise_for :users

  resources :products, only: %w(index new create)
  resources :orders, only: %w(index new create show)
end