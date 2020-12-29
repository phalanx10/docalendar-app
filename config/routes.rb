Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "tasks#index"
  resources :users, only: [:edit, :update]
  resources :tasks do
    collection do
      get 'search'
    end
  end
end