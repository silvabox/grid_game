class Grid
	DEFAULT_HEIGHT = 9
	DEFAULT_WIDTH = 9

	attr_reader :height, :width

	def initialize(height: DEFAULT_HEIGHT, width: DEFAULT_WIDTH)
		@height = height
		@width = width
		@matrix = {}

		@position_handler = PositionHandler.new
	end

	def cell_at(position)
		get_cell_at key(position), position
	end

	def set_content_at(position, val)
		cell_at(position).content = val
	end

	def content_at(position)
		cell_at(position).content
	end

	def row(at)
		keys = row_keys at
		keys.map { |key| get_cell_at key }
	end

	def column(at)
		keys = column_keys at
		keys.map { |key| get_cell_at key }
	end

	private

	def key(position)
		@position_handler.coords(position).join(':')
	end

	def coords(key)
		key.split(':').map { |part| Integer(part) }
	end

	def get_cell_at(key, position = nil)
		position = @position_handler.position(*coords(key)) unless position
		return @matrix[key] || create_cell_at(key, position)
	end

	def create_cell_at(key, position)
		@matrix[key] = Cell.new position
	end

	def row_keys(row)
		row = @position_handler.row_coord row
		(1..width).map { |col| "#{row}:#{col}" }
	end

	def column_keys(col)
		row = @position_handler.column_coord row
		(1..height).map { |row| "#{row}:#{col}" }
	end
end