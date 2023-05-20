class Admin::ReviewsController < ApplicationController

  def show
     @review = Review.find(params[:id])
     @movie = Movie.find(params[:movie_id])
  end

  private
    
    def review_params
        params.require(:review).permit(:movie_id, :review_contents, :rate).merge(:user_id)
    end

end
