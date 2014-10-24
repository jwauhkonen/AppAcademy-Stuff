class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :topic_id, presence: true
      t.integer :url_id, presence: true

      t.timestamps
    end
  end
end
