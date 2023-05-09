class Public::MoviesController < ApplicationController
 before_action :tmdb
  def tmdb
   require 'themoviedb-api'
   Tmdb::Api.key("3804a932a84eed879946981a8af29cbf")
   Tmdb::Api.language("ja")
  end 
 
 def search
  if params[:looking_for].present?
   @movieinfo = JSON.parse((Tmdb::Search.movie(params[:looking_for])).to_json)
  else
   @movieinfo = JSON.parse((Tmdb::Movie.popular).to_json)
  end
 end

 def show
  @movieinfo = Tmdb::Movie.detail(params[:id])
 end
    
end
