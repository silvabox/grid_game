class Grid
	DEFAULT_HEIGHT = 9
	DEFAULT_WIDTH = 9

	attr_reader :height, :width

	def initialize(height: DEFAULT_HEIGHT, width: DEFAULT_WIDTH)
		@height = height
		@width = width
		@matrix = {}
	end

	def cell_at(location)
		return @matrix[location] || create_cell_at(location)
	end

	def set_content_at(location, val)
		cell_at(location).content = val
	end

	def content_at(location)
		cell_at(location).content
	end	

	private

	def create_cell_at(location)
		@matrix[location] = Cell.new
	end
end