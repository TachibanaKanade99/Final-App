class UsersController < ApplicationController
	before_action :authenticate_user!, :find_user, only: [:edit, :show, :feeds, :discover]

	def edit
	end

	def show
	end

	def feeds
		#Get following users
		@following_users = @user.followings

		@following_photos = @following_users.map{ |user| Photo.joins(:user).where("photos.user_id = ? AND photos.sharing_mode = ?", user.id, "public") }.flatten!
		@following_photos = @following_photos.sort_by(&:created_at).reverse

		@following_albums = @following_users.map{ |user| Album.joins(:user).where("albums.user_id = ? AND albums.sharing_mode = ?", user.id, "public") }.flatten!
		@following_albums = @following_albums.sort_by(&:created_at).reverse
	end

	def discover
		# Get all users
		@users = User.all

		@discover_photos = @users.map{ |user| Photo.joins(:user).where("photos.user_id = ? AND photos.sharing_mode = ?", user.id, "public") }.flatten!
		@discover_photos = @discover_photos.sort_by(&:created_at).reverse

		@discover_albums = @users.map{ |user| Album.joins(:user).where("albums.user_id = ? AND albums.sharing_mode = ?", user.id, "public") }.flatten!
		@discover_albums = @discover_albums.sort_by(&:created_at).reverse
	end

	private

	def find_user
		@user = current_user
	end
end
