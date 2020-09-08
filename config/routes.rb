Rails.application.routes.draw do
  devise_for :users do
	  root to: 'devise/sessions#new'
  end
  # User
  resources :users, only: [:edit, :show] do
    resources :albums
    resources :photos
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Resourceful

  # Admin
  namespace :admin do
  	resources :users, :photos, :albums, only: [:show, :edit, :update, :destroy]
  end

  root 'home#show'
  # root 'devise/sessions#new'

  # Albums
  # namespace :albums do
  #   resources :photos, only: [:edit, :update, :show, :destory]
  # end
  # resources :albums
  # resources :users, only: [:new, :create, :show]

  # Non-resourceful
  # Signup
  # root 'users#new'
  # post 'users/new', to: 'users#create'
  #Signin
  # root 'home#create'
  # get '/exit', to: 'session#destroy', as: :logout

end