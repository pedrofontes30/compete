Rails.application.routes.draw do

  devise_for :federations, path: 'federations', controllers: { sessions: "federations/sessions", registrations: "federations/registrations" }
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations" }

  root to: 'pages#home'

  get '/profile', to: 'pages#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #Setup the page to redirect after sign up
  authenticated :user do
    root 'pages#home', as: :authenticated_user_root
  end

  authenticated :federation do
    root 'pages#home', as: :authenticated_federation_root
  end

  resources :competitions, only: [:show, :index] do
    resources :registrations, only: [:new, :create]
  end

    resources :federations, only: [:index, :show] do
    resources :affiliations, only: [:new, :create]
  end

   namespace :federation do
    resources :competitions do
      resources :heats, only: [:update]
    end
  end
  resources :orders, only: [:show, :create]  do
    resources :payments, only: :new
  end

end

