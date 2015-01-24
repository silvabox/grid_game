require './lib/position_handler'

describe PositionHandler do
	describe 'coords' do
		it "converts 'A1' to [1,1]" do
			expect(subject.coords('A1')).to eq [1,1]
		end
		it "converts 'B3' to [2,3]" do
			expect(subject.coords('B3')).to eq [2,3]
		end
	end

	describe 'position' do
		it "converts [1,1] to 'A1'" do
			expect(subject.position(1,1)).to eq 'A1'
		end
		it "converts [2,3] to 'B3'" do
			expect(subject.position(2,3)).to eq 'B3'
		end
	end

	describe 'row_coord' do
		it 'returns the position for a row' do
			expect(subject.row_coord('B')).to eq 2
		end
	end

	describe 'column_coord' do
		it 'returns the for a column' do
			expect(subject.column_coord(2)).to eq 2
		end
	end

	describe 'valid_position?' do
		it "returns true for 'A1'" do
			expect(subject.valid_position?('A1')).to be true
		end
	end
end