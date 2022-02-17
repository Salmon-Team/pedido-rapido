Rails.application.routes.draw do
  devise_scope :employees do
    get "/login" => "devise/sessions#new" # custom path to login/sign_in
    get "/logout" => "devise/registrations#new", as: "new_employee_registration" # custom path to sign_up/registration
  end
  devise_for :employees

  # root to: "home#index"
  resources :products
end
