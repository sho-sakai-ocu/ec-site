Rails.application.routes.draw do
  
  scope module: :public do
    root to: 'homes#top'
    get   'about'                => 'homes#about'
    get   'customers/my_page'    => 'customers#show'
    get   'customers/edit'       => 'customers#edit'
    patch 'customers/'           => 'customers#update'
    get   'customers/confirm'    => 'customers#confirm'
    patch 'customers/withdrawal' => 'customers#withdrawal'
    get   'items'                => 'items#index'
    get   'items/:id'            => 'items#show'
    get   'cart_items'           => 'cart_items#index'
  end

  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
    resources :customers, only: [:index, :show, :edit, :update]
  end


  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

end
