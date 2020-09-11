class PhotosController < ApplicationController

	def new
		@photo = Photo.new
	end

	def create
		# byebug
		@photo = Photo.create(photo_params)
		if @photo.valid?
			# flash[:success] = "Save Successfully!"
			redirect_to user_path(id: current_user.id)
		else
			flash[:error] = @photo.errors.messages
			redirect_to new_user_photo_path
		end
	end

	private

	def photo_params
		params.require(:photo).permit(:title, :sharing_mode, :image, :description, :user_id)
	end
		
end
