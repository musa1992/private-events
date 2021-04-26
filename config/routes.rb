Rails.application.routes.draw do
  root 'users#new'
  delete 'logout', to: 'sessions#destroy'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
 
end
