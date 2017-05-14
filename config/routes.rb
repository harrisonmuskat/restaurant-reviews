Rails.application.routes.draw do
  root "restaurants#index"
  resources :restaurants, only: [:index, :new, :create]
  resources :categories, only: [:index] do
    resources :restaurants, only: [:index]
  end

  resources :restaurants, only: [:show] do
    resources :reviews, only: [:index, :new, :create, :show]
  end
end
