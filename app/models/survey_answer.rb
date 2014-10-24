# == Schema Information
#
# Table name: survey_answers
#
#  id          :integer          not null, primary key
#  comment     :string(255)
#  rating      :integer
#  question_id :integer
#  student_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class SurveyAnswer < ActiveRecord::Base
	belongs_to :student, -> {where permission: "STUDENT"}, class_name: "User"
	belongs_to :question, class_name: "SurveyQuestion"

	validates :student, :question, presence: true
	validates :question, uniqueness: {scope: :student_id} 

	validate :valid_answer
	validate :rating_within_range

	def valid_answer
		return if !self.question
		if self.question.type_rating?
			errors.add(:rating, "must be present") if self.rating.nil?
			errors.add(:comment, "cannot be filled in a rating question") if self.comment
		else 
			errors.add(:comment, "must be present") if self.comment.nil?
			errors.add(:rating, "cannot be filled in a comment question") if self.rating
		end
	end

	def rating_within_range
		return unless question = self.question
		return unless self.rating && question.type_rating?
		if !(question.min_rating..question.max_rating).include?(self.rating)
			errors.add(:rating, "must between #{question.min_rating} and #{question.max_rating}")
		end
	end
end
