class Admin::AlbumsController < ApplicationController
    before_action :authenticate_user!, :find_album, only: [:edit, :update, :destroy]

    def edit
        flash.clear
    end

    def update
        # byebug
        add_new_images(image_params[:images])
        updated = @album.update!(album_params_without_images)

        if updated
            flash[:error] = "Update Successfully!"
            redirect_to admin_manage_albums_path
        else
            flash[:error] = @album.errors.messages
            redirect_to edit_admin_user_album_path
        end
    end

    def destroy
        destroyed = @album.destroy
        if destroyed
            flash[:error] = "Album deleted successfully!"
            redirect_to admin_manage_albums_path
        else
            flash[:error] = @album.errors.messages
            redirect_to edit_admin_user_album_path
        end
    end

    def remove_image
        @album = current_user.albums.find(params[:album_id])
        @album.images.delete_at(params[:image].to_i)
        @album.save
        redirect_to edit_user_album_path(id: @album.id)
    end

    private

    def album_params_without_images
        params.require(:album).permit(:title, :sharing_mode, :description)
    end

    def image_params
        params.require(:album).permit({ images: [] })
    end

    def add_new_images(new_image)
        images = @album.images
        images += new_image.to_a
        @album.assign_attributes(images: images)
    end

    def find_album
        @album = Album.find(params[:id])
    end
end
