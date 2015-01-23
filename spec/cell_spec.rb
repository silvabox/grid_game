require './lib/cell'

describe Cell do
	it 'has content' do
		subject.content = 'Test'
		expect(subject.content).to eq 'Test'
	end
end