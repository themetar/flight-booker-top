Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "flights#index"
  get "flights", to: "flights#index"
  resources :bookings, only: [:new, :create, :show]
end
