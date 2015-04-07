# == Schema Information
#
# Table name: survey_questions
#
#  id          :integer          not null, primary key
#  question    :string(255)      not null
#  answer_type :string(255)      not null
#  survey_id   :integer
#  min_rating  :integer
#  max_rating  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class SurveyQuestion < ActiveRecord::Base
	belongs_to :survey
	has_many :answers, class_name: "SurveyAnswer", foreign_key: :question_id, dependent: :destroy

	validates :question, presence: true
	validates :answer_type, inclusion: {in: ["COMMENT", "RATING"]}
	validates :question, uniqueness: {scope: :survey_id}
	validate :valid_rating_bounds

	def type_rating?
		return self.answer_type == "RATING"
	end

	def type_comment?
		return self.answer_type == "COMMENT"
	end

	def valid_rating_bounds
		if self.type_comment? && (self.min_rating || self.min_rating)
			errors.add(:question, "cannot set rating bounds for a comment question")
		elsif self.type_rating?
			return errors.add(:question, "both rating bounds must be present in a rating question") if self.min_rating.nil? || self.max_rating.nil?
			errors.add(:question, "max rating cannot be smaller than min rating") if self.max_rating < self.min_rating
		end
	end
end
