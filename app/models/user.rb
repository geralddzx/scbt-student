# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  before_validation :ensure_session_token
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true, email: true
  
  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?
    return user if user.password?(password) 
    nil
  end
   
  def password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.generate_token
    SecureRandom.urlsafe_base64
  end
  
  def reset_token
    self.session_token = User.generate_token
    self.save!
    self.session_token
  end
  
  def ensure_session_token
    self.session_token || self.session_token = User.generate_token
  end
end
