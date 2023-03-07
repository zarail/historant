Rails.application.routes.draw do
  devise_for :users do
    resources :places, only: %i[new create] # index
  end

  resources :places, only: %i[destroy show] do # edit update
    resources :menu_items, only: %i[new create] # index
  end

  resources :menu_items, only: %i[destroy show] do # edit update
    resources :reviews, only: %i[new create] # index
  end

  resources :reviews, only: %i[destroy show] # edit update

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
