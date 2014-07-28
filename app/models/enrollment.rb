# == Schema Information
#
# Table name: enrollments
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  status     :string(255)      not null
#  student_id :integer          not null
#  course_id  :integer          not null
#

class   Enrollment < ActiveRecord::Base
  before_validation :ensure_status_set
  validates :student_id, :course_id, presence: true
  validates :course_id, uniqueness: {scope: :student_id}
  validates :status, inclusion: {in: ["PENDING", "APPROVED", "COMPLETED"]}
  validates :student, :course, presence: true

  belongs_to :student, class_name: "User", foreign_key: :student_id
  belongs_to :course
  
  def ensure_status_set
    self.status ||= "PENDING"
  end
end
