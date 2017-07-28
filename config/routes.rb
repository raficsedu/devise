Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, path_names: {
    sign_in: 'login', sign_out: 'logout',
    password: 'secret', confirmation: 'verification',
    sign_up: 'register', edit: 'edit/profile'
  }

  get 'welcome/index'
  authenticated :user do
    root to: 'welcome#index', as: :authenticated_root
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
