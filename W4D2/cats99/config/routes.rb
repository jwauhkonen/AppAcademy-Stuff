Cats99::Application.routes.draw do
  root "cats#index"
  
  resources :cats
  
  resources :cat_rental_requests
  
  resources :users, only:  [:new, :create]  
  
  resource :session, only: [:new, :create, :destroy]
end
