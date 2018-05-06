Rails.application.routes.draw do

  resources :tickets, only: [:index, :show, :create, :update, :destroy]

  resources :reservations, only: [:index, :show, :create, :update, :destroy]

  resources :flights, only: [:index, :show, :create, :update, :destroy]

  resources :users, only: [:new, :index, :show, :create, :update]

  get "/pages/:page" => "pages#show"

  root "pages#show", page: "home"
end
