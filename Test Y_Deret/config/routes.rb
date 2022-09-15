Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :missions, only: :index
    resources :listings
    resources :bookings, only: :destroy
    resources :reservations, only: :destroy
  end
end
