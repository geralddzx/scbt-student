# == Schema Information
#
# Table name: enrollments
#
#  id          :integer          not null, primary key
#  student_id  :integer          not null
#  section_id  :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#  status      :string(255)      not null
#  grade       :integer
#  approver_id :integer
#

class Enrollment < ActiveRecord::Base
  before_validation :ensure_status_set
  
  validates :section, uniqueness: {scope: :student_id}
  validates :status, inclusion: {in: ["PENDING", "APPROVED", "COMPLETED"]}
  validates :section, presence: true
  validate :is_student
  validate :valid_approver

  belongs_to :student, class_name: "User", foreign_key: :student_id
  belongs_to :approver, class_name: "User", foreign_key: :approver_id
  belongs_to :section
  has_one :program, through: :section, source: :program
  
  def is_student
    unless self.student && self.student.student?
      errors.add(:student_id, "Enrolled user is not a student")
    end
  end
  
  def valid_approver
    if self.status == "PENDING"
      errors.add(:approver_id, "should not exist for pending enrollments") if self.approver
    else
      errors.add(:approver_id, "must be an admin") unless self.approver && self.approver.admin?
    end
  end
  
  def ensure_status_set
    self.status ||= "PENDING"
  end
end
