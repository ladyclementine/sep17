Rails.application.routes.draw do

  # Users auth routes
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations:'users/registrations'
  },
  path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'secret',
    confirmation: 'verification',
    unlock: 'unblock',
    registration: 'registration',
    sign_up: 'new'
  }

  authenticated :user do
  	resource :cart  do
      put 'add/:id', to: 'carts#add', as: :add_to
      put 'remove/:id', to: 'carts#remove', as: :remove_from
      get 'method' => 'carts#new', as: :form
    end

    resources :packages, only: [:index]

    post 'payment' => 'checkout#create', as: :payment
    get 'payment' => 'checkout#new'

    get 'events' => 'events#index', as: :events
    get 'my_events' => 'profile#events', as: :my_events
    get 'my_home' => 'profile#home', as: :my_home


    root 'profile#home', as: :authenticated_user_root
  end

  unauthenticated :user do
    root 'pages#index',  as: :unauthenticated_user_root

    namespace :challenge do
      get 'inscription/new' => 'team#new_inscription', as: :new_team_inscription
      post 'inscription' => 'team#create_inscription', as: :team_inscription

      get 'inscription/:team_id/equipe' => 'member#new_inscription', as: :new_members_inscription
      post 'inscription/:team_id/' => 'member#create_inscription', as: :members_inscription
    end

  end

  # Admin auth routes
  devise_for :admin, controllers: {
    sessions: 'admin/auth/sessions',
    confirmations: 'admin/auth/confirmations',
    passwords: 'admin/auth/passwords'
  },
  path: 'admin',
  path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'secret',
    confirmation: 'verification',
    unlock: 'unblock',
  }, skip: [:registrations]

  namespace :admin do
    authenticated :admin do
      resources :events
      resources :packages 
      resources :users
      patch 'users/:id/change_payment' => 'users#set_payment', as: :change_user_payment
      resources :admins
    end

    root 'events#index'
  end

end
