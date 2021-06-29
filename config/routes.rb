Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :items do
    get :uncategorized, on: :collection
  end
  resources :groups
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
