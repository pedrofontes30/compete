Rails.application.routes.draw do
  devise_for :federations
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :competitions, only: [:show] do
    resources :registrations, only: [:new]
  end
  resources :federations, only: [:index, :show] do
    resources :affiliations, only: [:new]
  end
end
