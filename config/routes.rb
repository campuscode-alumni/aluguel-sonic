Rails.application.routes.draw do

  root to: 'home#index'

  get "/search" => "home#search"
  resources :properties, only: [:show, :new, :create] do
    resources :seasons, shallow: true
    resources :proposals, shallow: true do
      post "accept", on: :member
    end
  end
end
