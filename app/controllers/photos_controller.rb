class PhotosController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :find_photo, only: [:edit, :update, :destroy]

	def new
		@photo = current_user.photos.new
	end

	def create
		# byebug
		@photo = current_user.photos.create(photo_params)
		if @photo.valid?
			redirect_to user_path(id: current_user)
		else
			flash[:error] = @photo.errors.messages
			redirect_to new_user_photo_path
		end
    end
    
    def edit
    end

    def update
        updated = @photo.update(photo_params)
        if updated
            redirect_to user_path(id: current_user)
        else
            flash[:error] = @photo.errors.messages
            redirect_to edit_user_photo_path
        end
    end

    def destroy
        destroyed = @photo.destroy
        if destroyed
            redirect_to user_path(id: current_user)
        else
            flash[:error] = @photo.errors.messages
            redirect_to edit_user_photo_path
        end
    end
    
    
	private

	def photo_params
		params.require(:photo).permit(:title, :sharing_mode, :image, :description)
    end
    
    def find_photo
        @photo = current_user.photos.find(params[:id])

        rescue ActiveRecord::RecordNotFound
            render :file => 'public/404.html', :status => :not_found, :layout => false
    end
end
