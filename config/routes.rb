Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :items
  resources :outfits, only: [:new, :index, :show] do
    member do
      get "affirmations/display", to: "affirmations#display"
    end
  end

  get "dress_me", to: "outfits#dress_me"
  get "profile", to: "pages#profile"
end
