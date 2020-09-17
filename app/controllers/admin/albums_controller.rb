class Admin::AlbumsController < ApplicationController
    before_action :authenticate_user!, :find_album, only: [:edit, :update, :destroy]

    def edit
    end

    def update
        # byebug 
        if !params[:album][:image].nil?
            @photo = @album.photos.new(photo_params)
            @photo.user_id = current_user.id
            @photo.save
        end
        updated = @album.update!(album_params)

        if updated
            flash[:success] = "Album Updated Successfully!"
            redirect_to admin_manage_albums_path
        else
            flash[:error] = @album.errors.messages
            redirect_to edit_admin_user_album_path
        end
    end

    def destroy
        destroyed = @album.destroy
        if destroyed
            flash[:success] = "Album deleted successfully!"
            redirect_to admin_manage_albums_path
        else
            flash[:error] = @album.errors.messages
            redirect_to edit_admin_user_album_path
        end
    end

    def remove_image
        @album = current_user.albums.find(params[:album_id])
        @album.photos.delete(params[:photo_id])
        @album.save
        # @photo = Photo.find(params[:photo_id])
        # @photo.destroy
        redirect_to edit_user_album_path(id: @album.id)
    end

    private

    def album_params
        params.require(:album).permit(:title, :sharing_mode, :description)
    end

    def photo_params
        params.require(:album).permit(:title, :sharing_mode, :description, :image, :user_id)
    end

    def find_album
        @album = Album.find(params[:id])

        rescue ActiveRecord::RecordNotFound
            render :file => 'public/404.html', :status => :not_found, :layout => false
    end
end
