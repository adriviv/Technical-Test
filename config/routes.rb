Rails.application.routes.draw do
  resources :bookings, only: :delete
  resources :reservations, only: :delete
  namespace :api, defaults: { format: :json } do
    resources :missions, only: :index
    resources :listing
  end
end
