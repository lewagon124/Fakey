Rails.application.routes.draw do
    resources :bookings do
    collection do
      get :checkout
    end
  end
  resources :products
  devise_for :users
    root to: 'products#index'
end
