Rails.application.routes.draw do
  devise_for :users
  resources :cars do
    resources :slots
    collection do
      get 'allcars'
    end
  end
  # get 'home/index'
  root 'home#index'
  get 'home/about'
  
end
