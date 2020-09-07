class AlbumsController < ApplicationController
	before_action :getAlbum, only: [:edit, :update]

	def getAlbum
		@album = Album.find(params[:id])
	end

	def edit
	end

	def show
	end	
	
	def update
		@new_title = params[:album][:title]
		@album.title = @new_title
		
		if @album.update(album_params)
			# flash[:notice] = 'Update Successfully'
			# redirect_to edit_album_path
			redirect_to newest_path
		else 
			flash[:error] = 'Title is too short'
			flash.now[:error] = 'Title is too short'
			render "edit"
			# redirect_to edit_album_path
		end
	end

	private 
		def album_params
			params.require(:album).permit(:title)
		end
end
