Rails.application.routes.draw do
	devise_for :users do
		root to: 'devise/sessions#new'
	end

	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

	# Resourceful

	# User
	resources :users, only: [:edit, :show, :update] do
		resources :albums, except: [:index]
		resources :photos, except: [:index]
		
		# User feeds
		get 'feeds'
		# get 'feeds/:status', to: 'users#feeds'

		# User discover
		get 'discover'
		# get 'discover/:status', to: 'users#discover'
	end

	# Admin
	namespace :admin do
		resources :users, :photos, :albums, only: [:show, :edit, :update, :destroy]
	end

	root 'users#feeds'
end