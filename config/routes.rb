Rails.application.routes.draw do
  devise_for :users
  get 'products/index'
  root to: "products#index"
  resources :products, only: [:index, :new, :create,:show] do
end
end
