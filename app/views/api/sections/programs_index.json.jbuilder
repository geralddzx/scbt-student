json.(@programs) do |program|
	json.program(program, :id, :name, :code, :hours)
	json.sections program.sections, partial: 'api/sections/show', as: :section
end