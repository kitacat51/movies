class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|

      # t.integer :genre_id
      # t.string :name
      # t.text :introduction
      # t.integer :price
      t.integer :user_id # レビューした人
      t.integer :movie_id # 映画ID
      t.text :review_contents # レビューコンテンツ(文章)
      t.float :rate # 星評価の数字
      # t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
