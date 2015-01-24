require './lib/grid'
require './lib/cell'

describe Grid do

	it 'has a default height' do
		expect(subject.height).to eq Grid::DEFAULT_HEIGHT
	end	

	it 'has a default width' do
		expect(subject.height).to eq Grid::DEFAULT_WIDTH
	end

	context 'when initializing with height and width' do
		subject { Grid.new(height: 10, width: 7)}

		it 'must have a height' do
			expect(subject.height).to eq 10
		end
		it 'must have a width' do
			expect(subject.width).to eq 7
		end
	end

	describe 'initializing with a block' do
		let(:cells) { [] }

		subject do 
			Grid.new(height: 3, width: 3) do |cell|
				cells << cell
			end
		end

		it 'should iterate all the cells in the new grid' do
			expect(cells).to eq subject.each_cell.to_a
		end
	end

	describe 'cell_at' do
		it 'returns a cell at a given position' do
			expect(subject.cell_at('A1')).to be_a Cell
		end

		it 'returns different cells for different positions' do
			expect(subject.cell_at('A1')).not_to eq subject.cell_at('B2')
		end
	end

	describe 'content_at' do
		it 'returns the same content as the cell at the same position' do
			subject.cell_at('A1').content = 'Test'
			expect(subject.content_at('A1')).to eq subject.cell_at('A1').content
		end
	end

	describe 'set_content_at' do
		it 'sets content of cell at given position' do
			subject.set_content_at 'A1', 'Test'
			expect(subject.cell_at('A1').content).to eq 'Test'
		end
	end

	describe 'row' do
		subject { Grid.new height: 5, width: 4 }

		it 'returns an array of cells in a row' do
			row = {
				'B1' => subject.cell_at('B1'),
				'B2' => subject.cell_at('B2'),
				'B3' => subject.cell_at('B3'),
				'B4' => subject.cell_at('B4')
			}
			expect(subject.row('B')).to eq row.values
		end
	end

	describe 'column' do
		subject { Grid.new height: 5, width: 4 }

		it 'returns an array of cells in a column' do
			col = {
				'A3' => subject.cell_at('A3'),
				'B3' => subject.cell_at('B3'),
				'C3' => subject.cell_at('C3'),
				'D3' => subject.cell_at('D3'),
				'E3' => subject.cell_at('E3')
			}
			expect(subject.column(3)).to eq col.values
		end
	end

	describe 'each_cell' do
		subject { Grid.new height: 3, width: 3 }

		it 'returns an Enumerator' do
			expect(subject.each_cell).to be_an Enumerator
		end

		it 'iterates each cell' do
			expected = subject.each_row.to_a.flatten

			cells = []
			subject.each_cell { |cell| cells << cell }

			expect(cells).to eq expected
		end
	end

	describe 'each_row' do
		subject { Grid.new height: 2, width: 3 }

		it 'returns an Enumerator' do
			expect(subject.each_row).to be_an Enumerator
		end

		it 'iterates each row' do
			expected = ('A'..'B').map { |row| subject.row(row) }

			rows = []
			subject.each_row { |row| rows << row }

			expect(rows).to eq expected
		end
	end

	describe 'each_column' do
		subject { Grid.new height: 3, width: 2 }

		it 'returns an Enumerator' do
			expect(subject.each_column).to be_an Enumerator
		end

		it 'iterates each col' do
			expected = [1, 2].map { |col| subject.column(col) }

			cols = []
			subject.each_column { |col| cols << col }

			expect(cols).to eq expected
		end
	end
end