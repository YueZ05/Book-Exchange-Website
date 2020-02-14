Rails.application.routes.draw do
  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'sessions/new'

  resources :books
  get 'users/new'

  root 'static_pages#home'
  get  '/signup',    to: 'users#new'
  get  '/sell',	     to: 'static_pages#sell'
  get  '/buy',	     to: 'static_pages#buy'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end end
  resources :books, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
