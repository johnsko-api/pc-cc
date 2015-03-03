Rails.application.routes.draw do
  root 'regions#index'
  resources :regions
  resources :teams

  namespace :admin do
    resources :homes, only: [:index]
    resources :regions, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :teams, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  devise_for :users
  resources :matches

end
