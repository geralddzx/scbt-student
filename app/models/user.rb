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
#  permission      :string(255)      not null
#  first_name      :string(255)      not null
#  last_name       :string(255)      not null
#
class User < ActiveRecord::Base
  attr_reader :password
  before_validation :ensure_session_token, :ensure_permission_set
  validates :email, :session_token, :first_name, :last_name, :permission, presence: true
  validates :email, uniqueness: true, email: true
  validates :permission, inclusion: {in: ["STUDENT", "INSTRUCTOR", "ADMIN", "MASTER"]}
  validates :password, length: { minimum: 6, allow_nil: true }
  has_many :enrollments, foreign_key: :student_id, dependent: :destroy
  has_many :enrolled_courses, through: :enrollments, source: :course 
  has_many :taught_courses, class_name: "Course", foreign_key: :instructor_id 
  
  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?
    return user if user.password?(password)
    email
  end
   
  def password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def password=(password)
    @password = password
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
  
  def ensure_permission_set
    self.permission ||= "STUDENT"
  end
  
  def admin?
    self.permission == "ADMIN"
  end
  
  def student?
    self.permission == "STUDENT"
  end
  
  def instructor?
    self.permission == "INSTRUCTOR"
  end
  
  def master?
    self.permission == "MASTER"
  end
end
