Rails.application.routes.draw do
  root 'homes#index'
  get 'regions' => 'regions#index'
  devise_for :users
end
