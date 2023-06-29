class Admin::ReviewsController < ApplicationController

before_action :authenticate_admin!

  def show
    # @review = Review.find(params[:id])
    # @movie = Movie.find(params[:movie_id])
     @review = Review.find(params[:id])
     @movie = Movie.find_by(tmdb_id: params[:id])
  end
  
   def destroy
      review =Review.find(params[:id])
      #byebug
      review.destroy
      redirect_to admin_path
   end
  
  private
    
    def review_params
        params.require(:review).permit(:movie_id, :review_contents, :score).merge(:user_id)
    end

end
