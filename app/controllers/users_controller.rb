class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:edit, :update, :show, :feeds, :discover, :toggle_like, :toggle_follow]
    
	def edit
	end

	def update
		updated = current_user.update(user_params)
		if updated
			redirect_to user_path
		else
			flash[:error] = current_user.errors.messages
			redirect_to edit_user_path
		end
	end

    def show
    end

	def feeds
        #Get following users
        @following_users = current_user.followings
        
        @following_photos = Photo.joins(:user).where(user_id: current_user.followings, sharing_mode: "public").order(created_at: :desc)
        @following_albums = Album.joins(:user).where(user_id: current_user.followings, sharing_mode: "public").order(created_at: :desc)

	end

	def discover
        # Get all users
        @users = User.all
        @discover_photos = Photo.joins(:user).where(user_id: @users, sharing_mode: "public").order(created_at: :desc)
        @discover_albums = Album.joins(:user).where(user_id: @users, sharing_mode: "public").order(created_at: :desc)
    end

    def toggle_like
        @liked = current_user.likes.find_by(likeable_id: params[:likeable_id])

        if @liked.nil?
            @like = current_user.likes.create(like_params)
            render 'likes_create'
        else
            @liked.destroy
            render 'likes_destroy'
        end
    end

    def toggle_follow
        @followed = current_user.followings.exists? params[:user_id]

        if !@followed
            @follow = current_user.followings << User.find(params[:user_id])
            render 'follows_create'
        else
            current_user.followings.delete(params[:user_id])
            render 'follows_destroy'
        end
    end

	private

	def user_params
		params.require(:user).permit(:avatar, :first_name, :last_name, :email, :password, :password_confirmation)
    end

    def like_params
        params.permit(:likeable_type, :likeable_id, :user_id)
    end

end
