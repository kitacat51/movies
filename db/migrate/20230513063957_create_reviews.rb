class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.text :review_contents # レビューコンテンツ(文章)
      t.float :rate # 星評価の数字
      t.timestamps
    end
  end
end
