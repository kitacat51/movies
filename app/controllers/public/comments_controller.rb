class Public::CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
      redirect_to reviews_path
  end

  def index
    @comment = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
    
  end
  
  private
    
  def comment_params
        params.require(:comment).permit(:body, :review_id).merge(user_id: current_user.id)
  end

end
