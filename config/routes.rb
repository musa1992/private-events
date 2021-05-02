Rails.application.routes.draw do
  root 'events#index'
  delete 'logout', to: 'sessions#destroy'
  get 'inbox', to: 'users#inbox'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
  resources :events, only: [:new, :create, :show, :index]
  resources :invitations, only: [:create, :update]
 
end
