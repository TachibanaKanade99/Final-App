class UsersController < ApplicationController
	before_action :authenticate_user!, :find_user, only: [:edit, :show]

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		save = @user.save
		if save
			# UserMailer.with(user: @user).welcome_email.deliver_later
			SendMailLaterJob.perform_later(@user)
			render 'show'
		else
			puts @user.email
			puts @user.errors.messages
			redirect_to new_user_path
		end
	end

	def edit
	end

	def show
		#Get following users
		@following_users = @user.followings

		# Get photos/albums from following users
		@following_photos = []
		@following_albums = []

		@following_users.each do |user| @following_photos += Photo.joins(:user).where("photos.user_id = ? AND photos.sharing_mode = ?", user.id, "public") end
		@following_photos = @following_photos.sort_by(&:created_at).reverse

		@following_users.each do |user| @following_albums += Album.joins(:user).where("albums.user_id = ? AND albums.sharing_mode = ?", user.id, "public") end
		@following_albums = @following_albums.sort_by(&:created_at).reverse
	end

	def destroy
		redirect_to root_path
	end

	def find_user
		@user = User.find(params[:id])
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password)
		end
end
