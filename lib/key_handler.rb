class KeyHandler
	ROW_NUMS = ('A'..'Z').to_a

	def get_coords(key)
		row = key.chars.first
		col = key.chars.last
		[get_row_coord(row), Integer(col)]
	end

	def get_key(*coords)
		row = ROW_NUMS[coords.first - 1]
		col = coords.last
		"#{row}#{col}"
	end

	def get_row_coord(row)
		ROW_NUMS.index(row) + 1
	end

	def get_column_coord(col)
		col
	end

	def valid_key?(key)
		true
	end
end