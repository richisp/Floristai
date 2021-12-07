Rails.application.routes.draw do
  root 'flowers#index'
  resources :flowers do
    member do
      post :create_order
    end
  end

  resources :orders
end
