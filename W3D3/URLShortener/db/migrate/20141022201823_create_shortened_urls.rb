class CreateShortenedUrls < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.string :long_url,  presence: true 
      t.string :short_url,  presence: true, unique: true 
      t.integer :user_id,  presence: true 

      t.timestamps
    end
  end
end
