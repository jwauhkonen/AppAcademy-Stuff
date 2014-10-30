class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :title, null: false
      t.string :category, null: false
      t.text :lyrics

      t.timestamps
    end
  end
end
