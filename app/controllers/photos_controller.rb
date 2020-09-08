class PhotosController < ApplicationController
	before_action :find_user, only: [:new, :create]

	def new
		@photo = Photo.new
	end

	def create
		# byebug
		@photo = Photo.create(user_params)
		if @photo.save
			flash[:success] = "Save Successfully!"
			redirect_to new_user_photo_path
		else
			flash[:error] = user_params
			redirect_to new_user_photo_path
		end
	end

	private
		def user_params
			params.require(:photo).permit(:title, :sharing_mode, :image, :description, :user_id)
		end

		def find_user
			@user = User.find(params[:user_id])
		end
end
