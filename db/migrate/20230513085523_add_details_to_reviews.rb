class AddDetailsToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :user_id, :integer
    add_column :reviews, :movie_id, :integer
  end
end
