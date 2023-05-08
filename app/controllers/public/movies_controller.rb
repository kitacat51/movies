class Public::MoviesController < ApplicationController
 before_action :tmdb
  def tmdb
   require 'themoviedb-api'
    Tmdb::Api.key("3804a932a84eed879946981a8af29cbf")
    Tmdb::Api.language("ja")
  end 
 
 def search
  
 end

 def show
 end
    
end
