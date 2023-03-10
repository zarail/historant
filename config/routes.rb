Rails.application.routes.draw do
  devise_for :users

  resources :places, only: %i[new create destroy show index] do # edit update index
    resources :menu_items, only: %i[new create] # index
  end

  resources :menu_items, only: %i[destroy show index] # edit update

  root to: "pages#home"

  get "dashboard", to: "pages#dashboard"
  get "search", to: "pages#search", as: :search


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
