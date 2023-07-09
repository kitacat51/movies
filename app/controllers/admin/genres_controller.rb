class Admin::GenresController < ApplicationController

before_action :authenticate_admin!

 def index
    @genres = Genre.all
 end

end