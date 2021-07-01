Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :items, except: [:show, :edit, :update] do
    get :uncategorized, on: :collection
  end
  resources :groups, except: [:edit, :update]
  resources :users, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
