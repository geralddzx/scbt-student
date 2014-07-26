# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  code       :string(255)
#  start_date :date
#  end_date   :date
#  hours      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Course < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :student_enrollments
  has_many :students, through: :student_enrollments, source: :student
end
