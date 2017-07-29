Rails.application.routes.draw do
  resources :ticket_loops
  resources :tickets
  root to: 'home#index'

  devise_for :users, path_names: {
    sign_in: 'login', sign_out: 'logout',
    password: 'secret', confirmation: 'verification',
    sign_up: 'register', edit: 'edit/profile'
  }

  #Authenticated user root route
  get 'welcome', to: 'welcome#index', as: :authenticated_root

  #Admin root route
  get 'admins', to: 'admins#index', as: :admin_root

  #Agent root route
  get 'agents', to: 'agents#index', as: :agent_root

  #Customer root route
  get 'customers', to: 'customers#index', as: :customer_root

  #Admin routes
  scope '/admins' do
    resources :tickets, :users, :ticket_loops
  end

  #Customer routes
  scope '/customers' do
    resources :tickets, :ticket_loops
  end

  #Agent routes
  scope '/agents' do
    resources :tickets, :ticket_loops
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
