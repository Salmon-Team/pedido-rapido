Rails.application.routes.draw do
  devise_for :employees
  
  root to: "products#index"

  resources :products
  resources :orders
end
