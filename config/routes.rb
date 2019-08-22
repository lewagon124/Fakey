Rails.application.routes.draw do
    resources :bookings do
    collection do
      get :checkout
    end
  end
  resources :products
  devise_for :users
    root to: 'products#index'

  post "/products/addcart", to: "products#add_to_cart"
  post "/products/removecart", to: "products#remove_from_cart"

  post "/products/addfav", to: "products#add_to_fav"
  post "/products/removefav", to: "products#remove_from_fav"
end
