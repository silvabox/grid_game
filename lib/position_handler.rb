class PositionHandler
  ROW_NUMS = ('A'..'Z').to_a

  def coords(position)
    row = position.chars.first
    col = position.chars.last
    [row_coord(row), Integer(col)]
  end

  def position(*coords)
    row = ROW_NUMS[coords.first - 1]
    col = coords.last
    "#{row}#{col}"
  end

  def row_coord(row)
    ROW_NUMS.index(row) + 1
  end

  def column_coord(col)
    col
  end

  def valid_position?(position)
    true
  end
end