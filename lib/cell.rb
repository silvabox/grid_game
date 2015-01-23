class Cell
	attr_accessor :content
	attr_reader :location

	def initialize(location)
		@location = location
	end

	def to_s
		"Cell #{location}"
	end
end