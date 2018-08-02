Rails.application.routes.draw do

  root to: 'pages#home'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users
      resources :services do
        resources :bookings, shallow: true do
          resources :reviews, shallow: true
        end
      end
      resources :dogs
      get '/login', to: 'login#login'
      post '/login', to: 'login#login'
    end
  end
end
