Rails.application.routes.draw do
  resources :cars
  # get 'home/index'
  root 'home#index'
  get 'home/about'
end
