Rails.application.routes.draw do

  root "root#root"
  resources :posts, except: [:new, :edit]
end
