class Cell
  attr_accessor :content
  attr_reader :position

  def initialize(position)
    @position = position
  end

  def to_s
    "Cell #{position}"
  end
end