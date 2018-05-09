Rails.application.routes.draw do
  root 'books#index'

  resources :books do
    member do
      get 'loan'
      get 'return'
    end
  end

  resources :rentals, only: :index

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
