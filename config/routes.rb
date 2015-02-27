Rails.application.routes.draw do
  root 'homes#index'
  resources :regions
  resources :teams

  namespace :admin do
    resources :homes, only: [:index]
    resources :regions
    resources :teams
  end

  devise_for :users
end
