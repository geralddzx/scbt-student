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
#  host_type   :string(255)      not null
#  host_id     :integer          not null
#

class SurveyAnswer < ActiveRecord::Base
	belongs_to :student, -> {where permission: "STUDENT"}, class_name: "User"
	belongs_to :question, class_name: "SurveyQuestion"
	belongs_to :subject, polymorphic: true

	validates :student, :question, :subject, presence: true
	validates :question, uniqueness: {scope: [:student_id, :subject_id, :subject_type]} 

	validate :valid_answer
	validate :valid_subject
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

	def valid_question
		question = self.question
		return if question.nil?
		unless question.survey_id == self.subject.survey_id
			errors.add(:question, "does not belong to the survey for this subject")
		end
	end

	def valid_subject
		subject = self.subject
		return if subject.nil?
		unless ["Campus", "Program", "User"].include? subject.class.to_s
			return errors.add(:subject, "must be a user, campus or program")
		end
		self.valid_question
		if subject.class.to_s == "User" && !subject.instructor?
			errors.add(:subject, "is a user but not an instructor") 
		end
	end
end
