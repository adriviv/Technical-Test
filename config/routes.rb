Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :missions, only: :index
    resources :listing
    resources :bookings, only: :destroy
    resources :reservations, only: :destroy
  end
end
