require './lib/grid'

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
end