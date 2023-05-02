class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|

      t.integer :genre_id
      t.string :name
      t.text :introduction
      t.integer :price
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end