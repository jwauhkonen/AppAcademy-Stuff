class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :user_id, presence: true
      t.integer :shortened_url_id, presence: true

      t.timestamps
    end
  end
end
