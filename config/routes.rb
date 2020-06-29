Rails.application.routes.draw do
  devise_for :federations
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :competitions do
    resources :competitions, only: [:index]
  end
end
