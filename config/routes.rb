Rails.application.routes.draw do

  resources :bookings
  resources :reservations
  resources :missions, only: :index
end
