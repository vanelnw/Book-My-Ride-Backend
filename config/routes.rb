Rails.application.routes.draw do
  resources :reservations
  resources :appointments
  resources :cars
  namespace :api do
    namespace :v1 do
      post 'auth/login', to: 'authentication#login'
      post 'auth/register', to: 'authentication#register'
      delete 'auth/logout', to: 'authentication#logout'
      
      resources :users
    end
  end
end
