class Api::ProgramFilesController < ApplicationController
	wrap_parameters :program_file, include: [:program_id, :file, :file_name]
	before_action :require_sign_in

	def program_index
		@program = Program.find(params[:program_id])
		@program_files = @program.program_files
		render "api/program_files/index"
	end

	def create
		@program_file = ProgramFile.new(program_file_params)
		if @program_file.save
		  render "api/program_files/show"
		else
		  render json: @program_file.errors.full_messages.join(", "), status: :unprocessable_entity
		end
	end

	def destroy
	    @program_file = ProgramFile.find(params[:id])
	    @program_file.file.destroy
	    @program_file.destroy!
	    render json: @program_file
  	end

	def program_file_params
		params.require(:program_file).permit(:file, :program_id, :file_name)
	end
end
