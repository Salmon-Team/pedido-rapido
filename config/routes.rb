Rails.application.routes.draw do
  root to: "admin/pages#home"

  devise_for :employees, :path => 'users', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

  scope module: 'admin' do
    constraints subdomain: 'admin' do
      resources :employees, only: [:index, :show, :new, :create, :edit, :update]  do
        get :toggle, on: :member, action: :toggle, as: :toggle
      end
      resources :products do
        get :toggle, on: :member, action: :toggle, as: :toggle
      end
      resources :categories
      resources :orders
      get '/dashboard', to: 'pages#dashboard'
    end
  end

  scope module: 'attendant' do
    constraints subdomain: 'comandavirtual' do
      resources :orders
    end
  end

  scope module: 'cook' do
    constraints subdomain: 'pedidos' do
      resources :orders
    end
  end

end
