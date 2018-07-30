class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.string :art
      t.integer :artist_id

      t.timestamps null: false
    end
  end
end