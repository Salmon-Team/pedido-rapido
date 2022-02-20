Rails.application.routes.draw do
  root to: "admin/static_pages#home"




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
