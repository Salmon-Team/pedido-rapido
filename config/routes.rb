Rails.application.routes.draw do
  root to: "products#index"

  resources :employees, only: [:index, :show, :new, :create, :edit, :update]

  devise_for :employees, :path => 'users', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

  resources :products

  resources :orders
end
