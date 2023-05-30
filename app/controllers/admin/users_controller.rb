class Admin::UsersController < ApplicationController

    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      #byebug
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_user_path(@user.id)
      else
        render :edit
      end
    end
    
  private
    def user_params
      params.require(:user).permit(:name, :email,:introduction, :is_deleted )
    end

end
