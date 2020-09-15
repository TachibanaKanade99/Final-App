Rails.application.routes.draw do
  get 'admin/edit'
  get 'admin/show'
  get 'admin/update'
	devise_for :users do
		root to: 'devise/sessions#new'
	end

	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

	# Resourceful

    # User
    resources :users, only: [:edit, :show, :update] do
        # Album
        resources :albums, except: [:index] do
            delete 'remove_image'
        end

        # Photo
        resources :photos, except: [:index]
        
        # User feeds
        get 'feeds'
        # User discover
        get 'discover'
    end

    namespace :admin, only: [:edit, :show, :update] do
        resources :users, only: [:edit, :update, :destroy] do
            #Photo
            resources :photos, only: [:edit, :update, :destroy]
            #Album
            resources :albums, only: [:edit, :update, :destroy] do
                delete 'remove_image'
            end
        end
        # Admin Role
        
        # Manage Photos
        get 'manage-photos'
        # Manage Albums
        get 'manage-albums'
        # Manage Users  
        get 'manage-users'
    end

	root 'users#feeds'
end