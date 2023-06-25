class Admin::HomesController < ApplicationController

before_action :authenticate_admin!

  def top
    @reviews = Review.all
  end

    
   def destroy
      review =Review.find(params[:id])
      review.destroy
      redirect_to admin_path
   end

end
