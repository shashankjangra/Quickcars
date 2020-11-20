Rails.application.routes.draw do
  devise_for :users
  resources :cars do
    resources :slots
  end
  # get 'home/index'
  root 'home#index'
  get 'home/about'
  
end
