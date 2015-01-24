require './lib/cell'

describe Cell do
  subject { Cell.new('B2') }
  
  it 'has content' do
    subject.content = 'Test'
    expect(subject.content).to eq 'Test'
  end

  describe 'to_s' do
    it 'returns "Cell B2"' do
      expect(subject.to_s).to eq 'Cell B2'
    end
  end
end