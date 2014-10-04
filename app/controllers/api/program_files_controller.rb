class Api::ProgramFilesController < ApplicationController
	wrap_parameters :program_file, exclude: []
	before_action :require_sign_in

	def program_index
		@program = Program.find(params[:program_id])
		@program_files = @program.program_files
		@change_permission = can_change?(@program)
		render "api/program_files/index"
		# render "api/programs/test.html.erb"
	end

	def create
		# render json: params
		@program_file = ProgramFile.new(program_file_params)
		content = params[:program_file][:file_file_content]
		@program_file.set_content(content)
		# @program_file.file.instance_write(:file_name, file_name_param)
		
		if can_change?(@program_file.program)
			if @program_file.save
				@program_file.save_file(:file)
			  render "api/program_files/show"
			else
			  render json: @program_file.errors.full_messages.join(", "), status: :unprocessable_entity
			end
		else
			render json: "You must be an admin or the instructor to add files to this program", status: :unauthorized
		end
	end

	def destroy
    @program_file = ProgramFile.find(params[:id])
    # @program_file.file.destroy
    if can_change?(@program_file.program)
    	@program_file.destroy!
    	render json: @program_file
    else
    	render json: "You must be an admin or the instructor to delete files in this program", status: :unauthorized
    end
	end

	def program_file_params
		params.require(:program_file).permit(:file_file_name, :program_id)
	end

	def file_name_param
		file_name = params.require(:program_file)[:file_name]
		if file_name
			file_name
		else
			file_name = "file.exe"
		end
	end

	def can_change?(program)
		unless current_user.admin? || program.instructor_id == current_user.id
			return false
		end
		true
	end
end
