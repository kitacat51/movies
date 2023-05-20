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
   #byebug
   @movieinfo = JSON.parse((Tmdb::Movie.popular).to_json)
  end
 end

 def show
  @movie = Movie.find_by(tmdb_id: params[:id])
  
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
  # 1. ジャンルテーブルに、@movieinfoのジャンルがなければ、
  # ジャンルを自動で追加されるようにする(ヒント: find_or_create_by)
  #@movieinfo[:genres].each do |genre|
  # Genre.find_or_create_by(name: genre.name)
  #end
        
  # 2. ジャンルと映画をつなぐ中間テーブルに映画テーブルのIDとジャンルIDを入れるようにする(ヒント: moview_genreかな…)
  #   2.1 テーブル作成
  #   2.2 中間テーブルにデータの入れ方を調べる
        
  # 3. 中間テーブルに(1)のジャンルと紐づけたものを入れる
        
  # 4. 投稿されたデータをMovieテーブルに書き込む
  
  
 end
 private 
  def movie_params
      params.require(:movie).permit(:title, :overview, :published, :image)
  end
    
end
