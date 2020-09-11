Rails.application.routes.draw do
	devise_for :users do
		root to: 'devise/sessions#new'
	end

	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

	# Resourceful

	# User
	resources :users, only: [:edit, :show, :update] do
		resources :albums, only: [:new, :create, :edit, :show, :destroy]
		resources :photos, only: [:new, :create, :edit, :show, :destroy]
		
		# User feeds
		get 'feeds'
		get 'feeds/:status', to: 'users#feeds'

		# User discover
		get 'discover'
		get 'discover/:status', to: 'users#discover'
	end

	# Admin
	namespace :admin do
		resources :users, :photos, :albums, only: [:show, :edit, :update, :destroy]
	end

	
	root 'users#feeds'

	# Albums
	# namespace :albums do
	#   resources :photos, only: [:edit, :update, :show, :destory]
	# end
	# resources :albums
	# resources :users, only: [:new, :create, :show]

end