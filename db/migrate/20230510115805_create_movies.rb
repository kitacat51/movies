class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      
      t.string :title
      t.text :overview
      t.date :published
      t.binary :image
      t.string :genre_id
      t.timestamps
      
    end
  end
end
