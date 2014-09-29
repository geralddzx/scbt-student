class Api::ProgramFilesController < ApplicationController
	wrap_parameters :program_file, include: [:program_id, :file, :file_name]
	before_action :require_sign_in

	def program_index
		@program = Program.find(params[:program_id])
		render json: @program.program_files, only: [:id, :name]
	end

	def create
		@program_file = ProgramFile.new(program_file_params)
		if @program_file.save
		  render json: @program_file
		else
		  render json: @program_file.errors.full_messages.join(", "), status: :unprocessable_entity
		end
	end

	def program_file_params
		params.require(:program_file).permit(:file, :program_id, :file_name)
	end
end
