Rails.application.routes.draw do
  resources :bookings
  resources :products
  devise_for :users
    root to: 'products#index'
end
