class Public::ReviewsController < ApplicationController
    def new
        @movieinfo = Tmdb::Movie.detail(params[:movie_id])
        @movie = Movie.new
    end
    
    def create
        @movieinfo = Tmdb::Movie.detail(params[:movie_id])
        
        
        # 1. ジャンルテーブルに、@movieinfoのジャンルがなければ、ジャンルを自動で追加されるようにする(ヒント: find_or_create_by)
        # @movieinfo['genres'].each do |genre|
        #     Genre.find_or_create_by(name: genres.name)
        # end
        
        # 2. ジャンルと映画をつなぐ中間テーブルに映画テーブルのIDとジャンルIDを入れるようにする(ヒント: moview_genreかな…)
        #   2.1 テーブル作成
        #   2.2 中間テーブルにデータの入れ方を調べる
        
        # 3. 中間テーブルに(1)のジャンルと紐づけたものを入れる
        
        # 4. 投稿されたデータをMovieテーブルに書き込む
        
    end
    
    private
    
    def movie_params
        params.require(:movie).permit(:movie_id, :review_contents, :rate).merge(user_id: current_user.id)
    end
end
