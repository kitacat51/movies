class Public::MoviesController < ApplicationController

 require 'themoviedb-api'
  Tmdb::Api.key("3804a932a84eed879946981a8af29cbf")
  Tmdb::Api.language("ja")
    
 def search
 end

 def show
 end
    
end
