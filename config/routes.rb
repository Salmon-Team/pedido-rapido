Rails.application.routes.draw do

  devise_for :employees
  
  # root to: "home#index"

  resources :products
end
