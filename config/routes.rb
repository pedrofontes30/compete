Rails.application.routes.draw do

  devise_for :federations, path: 'federations', controllers: { sessions: "federations/sessions", registrations: "federations/registrations" }
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations" }

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :competitions, only: [:index, :new, :create, :edit, :update, :destroy]


  resources :competitions, only: [:show] do
    resources :registrations, only: [:new, :create]
  end

  resources :federations, only: [:index, :show] do
    resources :affiliations, only: [:new, :create]
  end

  namespace :federation do
    resources :competitions
  end
end
