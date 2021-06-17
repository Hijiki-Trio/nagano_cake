Rails.application.routes.draw do
  devise_for :customers
  
  #会員側のルーティング
  scope module: :public do
    root to: "homes#top"
    get 'about' => 'homes#about'
    
    resources :products, only: [:index, :show]
    
    resources :cart_products, only: [:index, :create, :update]
      delete 'cart_products/destroy_all' => 'cart_products#destroy_all'
      delete 'cart_products/:id' => 'cart_products#destroy'
      
    resources :orders, only: [:index, :show, :create, :new]
    
    
    resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
  end
  
  #管理者側のルーティング
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }
  
  namespace :admin do
    resources :products
    post 'products' => 'products#create'
  end
end