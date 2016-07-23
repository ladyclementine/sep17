class SubdomainConstraint
  def self.matches?(request)
    subdomains = %w( www admin )
    request.subdomain.present? && !subdomains.include?(request.subdomain)
  end
end

class MaindomainConstraint
  def self.matches?(request)
    subdomains = %w( www admin )
    !request.subdomain.present? || subdomains.include?(request.subdomain)
  end
end

Rails.application.routes.draw do

  constraints SubdomainConstraint do
    root 'pages#show', as: :week_subdomain_root
  end

  constraints MaindomainConstraint do

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
      registration: 'register',
      sign_up: 'registration'
    }
    authenticated :user do
      root 'profiles#index', as: :authenticated_user_root
    end

    namespace :admin do
      devise_for :admin, controllers: {
        sessions: 'devise/sessions',
        confirmations: 'devise/confirmations',
        passwords: 'devise/passwords',
        registrations:'devise/registrations'
      },
      path: '',
      path_names: {
        sign_in: 'login',
        sign_out: 'logout',
        password: 'secret',
        confirmation: 'verification',
        unlock: 'unblock',
        registration: 'register',
        sign_up: 'registration'
      }
      authenticated :admin_admin do
        resources :weeks
        resources :events
      end

      root 'events#index'
    end

    root 'pages#index'
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
