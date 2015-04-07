# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#  permission      :string(255)      not null
#  first_name      :string(255)      not null
#  last_name       :string(255)      not null
#  street          :string(255)
#  city            :string(255)
#  country         :string(255)
#  postal_code     :string(255)
#  phone           :integer
#  referral        :string(255)
#  photo_url       :string(255)
#  survey_id       :integer
#  activation_code :string(255)
#

REFERRALS = [
  nil,
  "google",
  "facebook",
  "yelp",
  "51.ca", 
  "Superlife.ca"
]

PERMISSIONS = [
  "STUDENT", 
  "INSTRUCTOR", 
  "ADMIN", 
  "MASTER_ADMIN"
]

class User < ActiveRecord::Base
  # MAX_PHOTO_SIZE = 1.megabytes
  # MAX_PHOTO_DES = "1 megabyte"

  attr_reader :password
  attr_accessor :password_confirm
  before_validation :ensure_session_token, :ensure_permission_set
  
  validates :email, :session_token, :first_name, :last_name, :permission, presence: true
  validates :email, uniqueness: true, email: true
  validates :permission, inclusion: {in: PERMISSIONS}
  validates :password, length: { minimum: 6, allow_nil: true }
  validate :password_confirmation
  validate :password_exist
  validates :referral, inclusion: {in: REFERRALS}

  has_many :survey_answers, as: :subject, dependent: :destroy
  has_many :enrollments, foreign_key: :student_id, dependent: :destroy

  has_many :enrolled_sections, through: :enrollments, source: :section 
  has_many :enrolled_programs, through: :enrolled_sections, source: :program

  has_many :taught_sections, class_name: "Section", foreign_key: :instructor_id, dependent: :destroy
  has_many :taught_programs, through: :taught_sections, source: :program
  has_many :survey_questions, through: :survey, source: :questions
  
  belongs_to :survey
  validate :valid_survey_id

  # has_attached_file :photo, :path => 'profile_photos/:id/:attachment/:filename'
  # validates_attachment_content_type :photo, :content_type => /\Aimage/
  # validates_attachment_size :photo, less_than: User::MAX_PHOTO_SIZE

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?
    return user if user.password?(password)
    email
  end
  
  def password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password.to_s)
  end
  
  def password=(password)
    @password = password.to_s
    self.password_digest = BCrypt::Password.create(password.to_s)
  end

  def self.generate_token
    SecureRandom.urlsafe_base64
  end
  
  def reset_token
    self.session_token = User.generate_token
    self.save!
    self.session_token
  end

  def set_activation_code
    self.activation_code = User.generate_token
    self.save!
    self.activation_code
  end
  
  def ensure_session_token
    self.session_token || self.session_token = User.generate_token
  end
  
  def ensure_permission_set
    self.permission ||= "STUDENT"
  end
  
  def admin?
    self.permission == "ADMIN" || self.permission == "MASTER_ADMIN"
  end
  
  def student?
    self.permission == "STUDENT"
  end
  
  def instructor?
    self.permission == "INSTRUCTOR"
  end
  
  def master_admin?
    self.permission == "MASTER_ADMIN"
  end

  def set_photo(params)
    # return if !params[:user].has_key?(:photo)  
    if params[:user][:photo]
      name = params[:user][:photo_name] || "photo.jpg"
      self.photo.instance_write(:file_name, name)
    end
    # params[:user][:delete_old] = true
  end

  def name
    first_name + " " + last_name
  end

  def valid_survey_id
    if self.survey_id
      errors.add(:survey_id, "does not point to a survey") unless self.survey
      errors.add(:survey, "can only be hosted by instructors") unless self.instructor?
    end
  end

  def taken_survey?(subject)
    return false unless subject
    return !!SurveyAnswer.find_by(student_id: self.id, subject: subject)
  end

  def password_confirmation
    errors.add(:password, "does not match with confirmed password") unless password == password_confirm
  end

  def password_exist
    errors.add(:password, "cannot be blank") if password_digest.nil?
  end

  def self.students
    User.where(permission: "STUDENT")
  end

  def self.admins
    User.where(permission: "ADMIN")
  end

  def activated?
    !self.activation_code
  end
end


