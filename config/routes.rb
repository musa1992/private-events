Rails.application.routes.draw do
  root 'events#index'
  delete 'logout', to: 'sessions#destroy'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
  resources :events, only: [:new, :create, :show, :index]
  resources :invitations, only: [:create]
 
end
