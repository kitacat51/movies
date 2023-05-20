class Public::ReviewsController < ApplicationController
    def new
        @movie = Movie.find(params[:movie_id])
        @review = Review.new
    end
    
    def create
        
        @review = Review.new(review_params)
        @review.save
         redirect_to movie_path(@review.movie.tmdb_id)
        
        # 1. ジャンルテーブルに、@movieinfoのジャンルがなければ、ジャンルを自動で追加されるようにする(ヒント: find_or_create_by)
        # @movieinfo['genres'].each do |genre|
        #  Genre.find_or_create_by(name: genre.name)
        # end
        
        # 2. ジャンルと映画をつなぐ中間テーブルに映画テーブルのIDとジャンルIDを入れるようにする(ヒント: moview_genreかな…)
        #   2.1 テーブル作成
        #   2.2 中間テーブルにデータの入れ方を調べる
        
        # 3. 中間テーブルに(1)のジャンルと紐づけたものを入れる
        
        # 4. 投稿されたデータをMovieテーブルに書き込む
        
    end
    
    def show
        @movie = Movie.find(params[:movie_id])
        @review = Review.find(params[:id])
        @user = @review.user
    end
    
    private
    
    def review_params
        params.require(:review).permit(:movie_id, :review_contents, :rate).merge(user_id: current_user.id)
    end
end
