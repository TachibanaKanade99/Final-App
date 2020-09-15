class AdminController < ApplicationController
    before_action :authenticate_user!, only: [:edit, :update, :destroy, :manage_photos, :manage_albums, :manage_users]
    
    def manage_photos
        if current_user.admin?
            @photos = Photo.joins(:user).where(user_id: User.all)
        else
            flash[:error] = "You are not Admin =.="
            redirect_to user_path(id: current_user)
        end
    end

    def manage_albums
        if current_user.admin?
            @albums = Album.joins(:user).where(user_id: User.all)
        else
            flash[:error] = "You are not Admin =.="
            redirect_to user_path(id: current_user)
        end
    end

    def manage_users
        if current_user.admin?
            @users = User.all
        else
            flash[:error] = "You are not Admin =.="
            redirect_to user_path(id: current_user)
        end
    end

end
