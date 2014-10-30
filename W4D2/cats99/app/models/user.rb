class User < ActiveRecord::Base
  attr_reader :password
  
  validates :user_name, :password_digest, :session_token, presence: true
  validates :user_name, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  
  has_many :cats
  
  after_initialize :ensure_session_token
  
  def self.find_by_credentials(user_name, password)
    user = User.find_by_user_name(user_name)
    return nil unless user
    return nil unless user.is_password?(password)
    
    user
  end
  
  def self.set_session_token
    SecureRandom::urlsafe_base64(16)
  end
  
  def reset_session_token!
    self.session_token = self.class.set_session_token
    self.save!
    self.session_token
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  
  private
  
  
  def ensure_session_token
    self.session_token ||= self.class.set_session_token
  end
end
