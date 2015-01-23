class Grid
	DEFAULT_HEIGHT = 9
	DEFAULT_WIDTH = 9

	attr_reader :height, :width

	def initialize(height: DEFAULT_HEIGHT, width: DEFAULT_WIDTH)
		@height = height
		@width = width
	end
end