class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:edit, :update, :show, :destroy, :feeds, :discover, :manage_photos, :manage_albums, :manage_users]

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
    
    def destroy
    end

	def feeds

		# @following_photos = @following_users.map{ |user| Photo.joins(:user).where("photos.user_id = ? AND photos.sharing_mode = ?", user.id, "public") }.flatten!
		
		# if !@following_photos.nil?
		# 	@following_photos = @following_photos.sort_by(&:created_at).reverse
		# end

        # @following_albums = @following_users.map{ |user| Album.joins(:user).where("albums.user_id = ? AND albums.sharing_mode = ?", user.id, "public") }.flatten!
		
		# if !@following_albums.nil?
		# 	@following_albums = @following_albums.sort_by(&:created_at).reverse
        # end
        
        #Get following users
        @following_users = current_user.followings
        
        @following_photos = Photo.joins(:user).where(user_id: current_user.followings, sharing_mode: "public").order(created_at: :desc)
        @following_albums = Album.joins(:user).where(user_id: current_user.followings, sharing_mode: "public").order(created_at: :desc)

	end

	def discover
		# Get all users
		# @users = User.all

		# @discover_photos = @users.map{ |user| Photo.joins(:user).where("photos.user_id = ? AND photos.sharing_mode = ?", user.id, "public") }.flatten!
		
		# if !@discover_photos.nil?
		# 	@discover_photos = @discover_photos.sort_by(&:created_at).reverse
		# end

		# @discover_albums = @users.map{ |user| Album.joins(:user).where("albums.user_id = ? AND albums.sharing_mode = ?", user.id, "public") }.flatten!
		
		# if !@discover_albums.nil?
		# 	@discover_albums = @discover_albums.sort_by(&:created_at).reverse
        # end

        # Get all users
        @users = User.all
        @discover_photos = Photo.joins(:user).where(user_id: @users, sharing_mode: "public").order(created_at: :desc)
        @discover_albums = Album.joins(:user).where(user_id: @users, sharing_mode: "public").order(created_at: :desc)
    end

	private

	def user_params
		params.require(:user).permit(:avatar, :first_name, :last_name, :email, :password, :password_confirmation)
    end

end
