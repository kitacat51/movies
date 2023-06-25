class Admin::CommentsController < ApplicationController
  
  before_action :authenticate_user!
  
  def new
  end

  def create
  end

  def index
    @comments = Comment.all
    
  end

  def show
  end
  
  def destroy
    comment =Comment.find(params[:id])
    #byebug
    comment.destroy
    redirect_to admin_comments_path
  end
  
  
  private
    
  def comment_params
        params.permit(:body, :review_id).merge(user_id: current_user.id)
  end

end
