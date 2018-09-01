class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.string :title
      t.string :file
      t.integer :artist_id

      t.timestamps null: false
    end
  end
end
#add column
