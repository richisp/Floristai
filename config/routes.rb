Rails.application.routes.draw do
  root 'flowers#index'
  resources :flowers do
    member do
      post :create_order
    end
  end

  resources :orders do
    member do
      post :finish
      post :cancel
      get :generate_report, to: 'orders#generate_report', as: 'generate_report', defaults: { format: :csv }
    end
  end

  resources :users do
    member do

    end
  end

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'

  get 'google_authenticator', to: 'users#google_authenticator'
  post :update_google_authenticator, to: 'users#update_google_authenticator'
end
