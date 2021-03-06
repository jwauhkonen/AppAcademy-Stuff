class TagTopic < ActiveRecord::Base
  
  validates :topic, presence: true
  
  has_many(
    :taggings,
    class_name: "Tagging",
    foreign_key: :topic_id,
    primary_key: :id 
  )
  
  has_many :urls, -> { distinct }, through: :taggings, source: :shortened_url 
  
end
