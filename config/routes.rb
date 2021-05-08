Rails.application.routes.draw do
  root 'events#index'
  delete 'logout', to: 'sessions#destroy'
  get 'inbox', to: 'users#inbox'
  get 'user_events', to: 'users#user_created_events'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
  resources :events, only: [:new, :create, :show, :index]
  resources :invitations, only: [:create, :update]
 
end
