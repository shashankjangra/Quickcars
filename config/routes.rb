Rails.application.routes.draw do
  resources :cars do
    resources :slots
  end
  # get 'home/index'
  root 'home#index'
  get 'home/about'
end
