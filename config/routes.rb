Rails.application.routes.draw do
  root to: 'pages#home'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users do
        resources :services, only: [ :index, :show, :update, :create ]
        resources :dogs, only: [ :index, :show, :update, :create ]
      end
      resources :services, only: [ :destroy ]
      resources :dogs, only; [ :destroy ]
    end
  end
