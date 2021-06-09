Rails.application.routes.draw do
  get 'buys/index'
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :buys, only: [:index, :create]
    resources :address, only: [:index, :new, :create]
  end
end
