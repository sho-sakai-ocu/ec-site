Rails.application.routes.draw do
  
  scope module: :public do
    root to: 'homes#top'
    get   'about'                => 'homes#about'
    get   'customers/my_page'    => 'customers#show'
    get   'customers/edit'       => 'customers#edit'
    patch 'customers/'           => 'customers#update'
    get   'customers/confirm'    => 'customers#confirm'
    patch 'customers/withdrawal' => 'customers#withdrawal'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/completed' => 'orders#completed'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :index, :create, :show]
  end

  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update] do
      resources :order_details, only: [:update]
    end
  end


  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

end
