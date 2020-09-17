class Admin::UsersController < ApplicationController
    before_action :authenticate_user!, :find_user, only: [:edit, :update, :destroy]

    def edit
    end

    def update
        # byebug
        updated = @user.update!(user_params)

        if updated
            flash[:success] = "Update user successfully!"
            redirect_to admin_manage_users_path
        else
            flash[:error] = @user.errors.messages
            redirect_to edit_admin_user_path
        end
    end

    def destroy
        destroyed = @user.destroy

        if destroyed
            flash[:success] = "Delete user successfully!"
            redirect_to admin_manage_users_path
        else
            flash[:error] = @user.errors.messages
            redirect_to edit_admin_user_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :active)
    end

    def find_user
        @user = User.find(params[:id])
    end

end
