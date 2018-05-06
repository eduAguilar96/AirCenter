Rails.application.routes.draw do

  resources :tickets, only: [:index, :show, :create, :update, :destroy]

  resources :reservation_informations, only: [:index, :show, :create, :update, :destroy]

  resources :flights, only: [:index, :show, :create, :update, :destroy]

  resources :users, only: [:new, :index, :show, :create, :update]

  root 'flights#index'
end
