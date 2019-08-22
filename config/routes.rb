Rails.application.routes.draw do
    resources :bookings do
    collection do
      get :checkout
    end
  end
  resources :products
  devise_for :users
    root to: 'products#index'
  # sending data to the server
  post "/products/addcart", to: "products#add_to_cart"
  post "/products/removecart", to: "products#remove_from_cart"
  # render a page
  get "/search", to: "products#search"
end
