class Public::MoviesController < ApplicationController
 before_action :tmdb
  def tmdb
   require 'themoviedb-api'
   Tmdb::Api.key("3804a932a84eed879946981a8af29cbf")
   Tmdb::Api.language("ja")
  end 
 
 def search
  #byebug
  if params[:looking_for].present?
   @movieinfo = JSON.parse((Tmdb::Search.movie(params[:looking_for])).to_json)
  elsif params[:movie_genre].present?
  # genre_id = Genre.find_by(name: params[:movie_genre]).id
  # movie_ids = MovieGenre.where(genre_id: genre_id).pluck(:movie_id)
  # movies = Movie.where(id: movie_ids)
   genre = Genre.find_by(name: params[:movie_genre])
   movies = genre.movies
   @movieinfo = JSON.parse((Tmdb::Search.movie([])).to_json)
   movies.each do |movie|
     @movieinfo["table"]["results"] << JSON.parse((Tmdb::Search.movie(movie.title)).to_json)["table"]["results"][0]
   end
  else
   #byebug
   @movieinfo = JSON.parse((Tmdb::Movie.popular).to_json)
  end
 end

 def show
  if params[:tmdb_id]
   @movie = Movie.find_by(tmdb_id: params[:tmdb_id])
  else
   @movie = Movie.find(params[:id])
  end
  # searchと併用しているため、Movieがデータがない場合、
  # データを作成してからshowページを表示するようにしている。
  if @movie.nil?
   movie = Tmdb::Movie.detail(params[:id])
   @movie = Movie.create!(overview: movie["overview"], 
              title: movie["title"], 
              published: movie["release_date"], 
              image: movie["poster_path"],
              tmdb_id: movie["id"])
   
   # ジャンルを中間テーブルに生成する
   movie['genres'].each do |genre|
    n_genre = Genre.find_by(name: genre.name)
   
    if !n_genre
        n_genre = Genre.create!(name: genre.name)
        n_genre.movie_genres.create!(movie_id: @movie.id)
    else
     n_genre.movie_genres.create!(movie_id: @movie.id)
    end
   end
  end
  #Tmddからどんな情報が取得できているか表示するときに使う
  #@movieinfo = Tmdb::Movie.detail(params[:id])
  #if @movieinfo.blank?
  #  @movieinfo = Tmdb::Movie.detail(@movieinfo.id)
  #end
 end
    
 def create
  #byebug
  @movieinfo = Tmdb::Movie.detail(params[:movie][:movie_id])
        
  # レビューの作成
  Review.create(review_contents: params[:movie][:review_contents],
                user_id: current_user.id,
                movie_id: @movieinfo.id,
                rate: 0.0)
  
  redirect_to movie_path(@movieinfo.id)

 end
 private 
  def movie_params
      params.require(:movie).permit(:title, :overview, :published, :image)
  end
    
end
