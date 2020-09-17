class Admin::PhotosController < ApplicationController
    before_action :authenticate_user!, :find_photo, only: [:edit, :update, :destroy]

    def edit
    end

    def update
        # byebug
        updated = @photo.update!(photo_params)

        if updated
            flash[:success] = "Update Photo successfully!"
            redirect_to admin_manage_photos_path
        else
            flash[:error] = @photo.errors.messages
            redirect_to edit_admin_user_photo_path
        end
    end

    def destroy
        destroyed = @photo.destroy

        if destroyed
            flash[:success] = "Photo deleted successfully!"
            redirect_to admin_manage_photos_path
        else
            flash[:error] = @photo.errors.messages
            redirect_to edit_admin_user_photo_path
        end
    end

    private

    def photo_params
        params.require(:photo).permit(:title, :sharing_mode, :description, :image)
    end

    def find_photo
        @photo = Photo.find(params[:id])
    end
    
end
