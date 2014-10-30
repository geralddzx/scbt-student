class Api::SurveyAnswersController < ApplicationController
	def subject_index
		fail
	end

	def request_root_class
		request.url.split("/")[4].singularize.capitalize.constantize
	end
end
