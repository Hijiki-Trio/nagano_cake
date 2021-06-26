Rails.application.routes.draw do
  devise_for :customers, controllers: {
  registrations: 'customers/registrations',
  sessions: 'customers/sessions'
  }

  #会員側のルーティング
  scope module: :public do
    root to: "homes#top"
    get 'about' => 'homes#about'

    resources :customers,only: [:edit, :update, :show] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end

    resources :products, only: [:index, :show]


    resources :cart_products, only: [:index, :create, :update]
      delete 'cart_products/destroy_all' => 'cart_products#destroy_all'
      delete 'cart_products/:id' => 'cart_products#destroy'

      get 'orders/complete' => 'orders#complete'
    resources :orders, only: [:index, :show, :create, :new]
      post 'orders/confirm' => 'orders#confirm'



    resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
  end

  #管理者側のルーティング
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }

  namespace :admin do
    resources :products
    resources :genres, only: [:index, :edit, :create, :update]
    resources :customers, only: [:index, :show, :edit, :update]  #追加しました。
    resources :orders, only: [:index, :show, :update]
    resources :order_products, only: [:update]
  end
end