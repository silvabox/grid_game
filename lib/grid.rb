class Grid
	DEFAULT_HEIGHT = 9
	DEFAULT_WIDTH = 9

	attr_reader :height, :width

	def initialize(height: DEFAULT_HEIGHT, width: DEFAULT_WIDTH)
		@height = height
		@width = width
		@matrix = {}

		@key_handler = KeyHandler.new
	end

	def cell_at(location)
		key = @key_handler.get_key(location)
		get_cell_at key, location
	end

	def set_content_at(location, val)
		cell_at(location).content = val
	end

	def content_at(location)
		cell_at(location).content
	end

	def row(at)
		keys = @key_handler.get_row_keys(at, width)
		keys.map { |key| get_cell_at(key) }
	end

	def column(at)
		keys = @key_handler.get_column_keys(at, height)
		keys.map { |key| get_cell_at(key) }
	end

	private

	def get_cell_at(key, location = nil)
		location = @key_handler.get_client_key(key) unless location
		return @matrix[key] || create_cell_at(key, location)
	end

	def create_cell_at(key, location)
		@matrix[key] = Cell.new(location)
	end
end