class Public::ReviewsController < ApplicationController
    def new
        @movie = Movie.find(params[:movie_id])
        @review = Review.new
    end
    
    def create
        
        @review = Review.new(review_params)
        @review.save
         redirect_to movie_path(@review.movie.tmdb_id)
        
    end
    
    def show
        #@movie = Movie.find(params[:movie_id]) tmdbからの情報を表示させる時に使用
        @review = Review.find(params[:id])
        @user = @review.user.id
        @movie = Movie.find_by(tmdb_id: params[:id])
    end
    
    def index
        @reviews = Review.all
    end
    
    def edit
      @review = Review.find(params[:id])
    end

    def update
      @review = Review.find(params[:id])
      if @review.update(review_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to review_path(@review.id)
      else
        render :edit_review_path
      end
    end
    
    def destroy
      review =Review.find(params[:id])
      review.destroy
      redirect_to mypage_path
    end
    
    private
    
    def review_params
        params.require(:review).permit(:movie_id, :review_contents, :rate).merge(user_id: current_user.id)
    end
    
    def is_matching_login_user
       review = Review.find(params[:id])
       user_id = review.user_id
       unless user_id == current_user.id
         redirect_to mypage_path
       end
    end
end


        # 1. ジャンルテーブルに、@movieinfoのジャンルがなければ、ジャンルを自動で追加されるようにする(ヒント: find_or_create_by)
        # @movieinfo['genres'].each do |genre|
        #  Genre.find_or_create_by(name: genre.name)
        # end
        
        # 2. ジャンルと映画をつなぐ中間テーブルに映画テーブルのIDとジャンルIDを入れるようにする(ヒント: moview_genreかな…)
        #   2.1 テーブル作成
        #   2.2 中間テーブルにデータの入れ方を調べる
        
        # 3. 中間テーブルに(1)のジャンルと紐づけたものを入れる
        
        # 4. 投稿されたデータをMovieテーブルに書き込む
        