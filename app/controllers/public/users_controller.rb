class Public::UsersController < ApplicationController

  def mypage
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  def unsubscribe
    @user = current_user
  end

  def withdrawal
    @user = current_customer
      if @user.update(is_deleted: true)
         reset_session
         redirect_to root_path
      else
         redirect_to mypage_path
      end
  end
  
 private
    def user_params
      params.require(:user).permit(:name, :email)
    end
    
    def is_matching_login_user
       user_id = params[:id].to_i
       unless user_id == current_user.id
         redirect_to user_path(current_user)
       end
    end
end
