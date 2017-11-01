Rails.application.routes.draw do

  devise_for :owners
  root to: 'home#index'

  get "/search" => "home#search"
  get "/proposals" => "proposals#index"
  resources :properties, only: [:show, :new, :create] do
    resources :seasons, shallow: true
    resources :proposals, shallow: true do
      post "accept", on: :member
    end
    resources :unavailable_periods, only: [:new, :create]
  end
end
