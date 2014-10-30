class AddDefaultValues < ActiveRecord::Migration
  def up
    change_column :albums, :category, :string, default: "studio"
    
    change_column :tracks, :category, :string, default: "regular"
  end
  
  def down
    change_column :albums, :category, :string, default: nil
    
    change_column :tracks, :category, :string, default: nil
  end
end
