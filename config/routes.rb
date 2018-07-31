Rails.application.routes.draw do
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
