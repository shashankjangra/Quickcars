Rails.application.routes.draw do
  devise_for :users
  resources :cars do
    resources :slots do
      resources :requests
    end
    collection do
      get 'allcars'
    end
  end
  root 'home#index'
  get 'home/about'
end
