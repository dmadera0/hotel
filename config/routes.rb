Rails.application.routes.draw do
  resources :reservations
  resources :rooms
  resources :guests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/login', to: 'authentication#login'
end
