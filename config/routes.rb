Rails.application.routes.draw do

  get 'items' => 'items#index'
  get 'items/:id' => 'items#show'

  namespace :admin do
    root to: 'homes#top'
  end

  namespace :customers do
    root to: 'homes#top'
    get   'about'      => 'homes#about'
    get   'my_page'    => 'customers#show'
    get   'edit'       => 'customers#edit'
    patch '/'          => 'customers#update'
    get   'confirm'    => 'customers#confirm'
    patch 'withdrawal' => 'customers#withdrawal'
  end

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "customers/registrations",
    sessions: 'customers/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

end
