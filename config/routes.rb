Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get "/categories", to: "home#categories"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/popularity", to: "home#popular"

  resources :memes, only: [:show, :new, :create, :edit, :update] do
    resources :comments, only:[:create]
  end
end
