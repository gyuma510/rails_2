Rails.application.routes.draw do
  devise_for :members
  root to: "home#index"
  resources :members
  resources :rooms
  resources :reservations
end
