Rails.application.routes.draw do
  root 'homes#index'
  get 'regions' => 'regions#index'
  get 'teams' => 'teams#index'
  devise_for :users
  resources :matches

end
