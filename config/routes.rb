Rails.application.routes.draw do
  root 'brands#index'
  devise_for :users
  resources :brands
  resources :phones
end
