class AlbumsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :find_album, only: [:edit, :update, :destroy]

	def new
        @album = current_user.albums.new
    end

    def create
        # byebug
        @album = current_user.albums.create(album_params)
        if @album.valid?
            flash[:success] = "Add Successfully"
            redirect_to user_path(id: current_user)
        else
            flash[:error] = @album.errors.messages
            redirect_to new_user_album_path
        end
    end

	def edit
	end
	
    def update
        # byebug
        updated = @album.update!(title: params[:album][:title],
                                sharing_mode: params[:album][:sharing_mode],
                                description: params[:album][:description],
                                images: @album.images + params[:album][:images].to_a
                                )
        # updated = @album.update!(album_params)
        if updated
            redirect_to user_path(id: current_user)
        else
            flash[:error] = @album.errors.messages
            redirect_to edit_user_album_path
        end
    end
    
    def destroy
        destroyed = @album.destroy
        if destroyed
            redirect_to user_path(id: current_user)
        else
            flash[:error] = @album.errors.messages
            redirect_to edit_user_album_path
        end 
    end

    def remove_image
        @album = current_user.albums.find(params[:album_id])
        @album.images.delete_at(params[:image].to_i)
        @album.save
        redirect_to edit_user_album_path(id: @album.id)
    end

	private 
		def album_params
			params.require(:album).permit(:title, :sharing_mode, :description, { images: [] })
        end
        
        def find_album
            @album = current_user.albums.find(params[:id])

            rescue ActiveRecord::RecordNotFound
                render :file => 'public/404.html', :status => :not_found, :layout => false
        end
end
