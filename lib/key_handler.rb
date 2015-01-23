class KeyHandler
	ROW_NUMS = ('A'..'Z').to_a

	def get_key(client_key)
		row = client_key.chars.first
		col = client_key.chars.last
		"#{ROW_NUMS.index(row) + 1}:#{col}"
	end

	def get_client_key(key)
		row = ROW_NUMS[Integer(key.chars.first) - 1]
		col = key.chars.last
		"#{row}#{col}"
	end

	def get_row_keys(row, width)
		row = ROW_NUMS.index(row) + 1
		keys = []
		(1..width).each do |col|
			keys << "#{row}:#{col}"
		end
		keys
	end

	def get_column_keys(col, height)
		cols = []
		(1..height).each do |row|
			cols << "#{row}:#{col}"
		end
		cols
	end

	def valid_key?(key)
		true
	end
end