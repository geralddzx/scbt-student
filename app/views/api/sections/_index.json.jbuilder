sections = @sections if @sections

json.array! sections, partial: 'api/sections/show', as: :section
