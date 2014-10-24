class Tagging < ActiveRecord::Base
  
  validates :topic_id, :url_id, presence: true
  
  belongs_to(
    :tag_topic,
    class_name: "TagTopic",
    foreign_key: :topic_id,
    primary_key: :id
  )
  
  belongs_to(
    :short_url,
    class_name: "ShortenedUrl",
    foreign_key: :url_id,
    primary_key: :id
  )
  
  def self.create_tag!(tag_id, short_url_string)
    short_url = ShortenedUrl.find_by(short_url: short_url_string)
    Tagging.create!( topic_id: tag_id, url_id: short_url.id)
  end
  
end
