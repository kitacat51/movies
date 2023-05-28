class Public::CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save!
      redirect_to review_path(comment_params[:review_id])
  end

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end
  
  private
    
  def comment_params
        params.permit(:body, :review_id).merge(user_id: current_user.id)
  end

end
