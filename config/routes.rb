Rails.application.routes.draw do
  get 'users_controller/index'
  get 'users_controller/show'
  get 'users_controller/new'
  get 'users_controller/create'
  get 'users_controller/edit'
  get 'users_controller/update'
  get 'users_controller/destroy'
  root to: 'pages#home'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users
      resources :services do
        resources :bookings, only: [ :index, :show, :update, :create ] do
          resources :review, only: [ :index ]
        end
      end
      resources :dogs
      resources :bookings, only: [ :destroy ]
    end
  end
end
