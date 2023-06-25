class Admin::GenresController < ApplicationController

before_action :authenticate_user!

 def index
    @genres = Genre.all
 end

end