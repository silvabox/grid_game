require './lib/key_handler'

describe KeyHandler do
	describe 'get_key' do
		it "converts 'A1' to '1:1'" do
			expect(subject.get_key('A1')).to eq '1:1'
		end
	end

	describe 'get_client_key' do
		it "converts '1:1' to 'A1'" do
			expect(subject.get_client_key('1:1')).to eq 'A1'
		end
	end

	describe 'get_row_keys' do
		it 'returns an array of keys for a row' do
			expect(subject.get_row_keys('B', 3)).to eq ['2:1', '2:2', '2:3']
		end
	end

	describe 'get_column_keys' do
		it 'returns an array of keys for a column' do
			expect(subject.get_column_keys(2, 3)).to eq ['1:2', '2:2', '3:2']
		end
	end

	describe 'valid_key?' do
		it "returns true for 'A1'" do
			expect(subject.valid_key?('A1')).to be true
		end
	end
end