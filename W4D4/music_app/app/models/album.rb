class Album < ActiveRecord::Base
  validates :title, :band_id, :category, presence: true
  
  belongs_to :band
  
  has_many :tracks, dependent: :destroy
  
  
  
end
