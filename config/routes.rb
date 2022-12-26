Rails.application.routes.draw do
  
  devise_for :members
  root to: "home#index"
  
  get '/members/account'
  
  get '/members/profile'
  
  resources :rooms do
    collection do
      get 'search'
    end
  end
  
  resources :reservations
  
  resources :members

end
