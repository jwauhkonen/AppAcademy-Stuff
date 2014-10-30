class Track < ActiveRecord::Base
  validates :album_id, :title, :category, presence: true
  
  belongs_to :album
  
  has_one :band, through: :album, source: :band
  
end
