class ShortenedUrl < ActiveRecord::Base
  validates :long_url, :short_url, :submitter, presence: true
  validates :short_url, uniqueness: true
  validates :long_url, length: { maximum: 1024 }
  validate :not_spam
  
  belongs_to(
    :submitter,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
  
  has_many(
    :visits,
    class_name: "Visit",
    foreign_key: :shortend_url_id,
    primary_key: :id
  )
  
  has_many(
    :taggings,
    class_name: "Tagging",
    foreign_key: :url_id,
    primary_key: :id
  )
  
  has_many :tag_topics, -> { distinct }, through: :taggings, source: :tag_topic 
  
  has_many :visitors, -> { distinct }, through: :visits, source: :user 
  
  
  def self.random_code
    begin
      result = SecureRandom.urlsafe_base64(16)
    end while ShortenedUrl.exists?(short_url: result)
    result
  end
  
  def self.create_for_user_and_long_url!(user, long_url)
    short_url = ShortenedUrl.random_code
    
    ShortenedUrl.create!(
      short_url: short_url, 
      long_url: long_url, 
      user_id: user.id
    )
  end
  
  def num_clicks
    Visit.select(:user_id).count
  end
    
  def num_uniques
    visitors.count
  end
  
  def num_recent_uniques
    Visit
      .select(:user_id)
      .where(created_at: (10.minutes.ago..Time.now))
      .count
  end
  
  private
  
  def not_spam
    if query?
      errors[:user_id] << "nice try, spambot"
    end
  end
  
  def query?
    2 <= ShortenedUrl.where(
          user_id: user_id,              
          created_at: (1.minute.ago..Time.now)).count
  end
end
