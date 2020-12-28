Rails.application.routes.draw do

  devise_for :users
  root to: "tasks#index"
  resources :users, only: [:edit, :update, :show]
  resources :tasks do
    collection do
      get 'search'
    end
  end
end