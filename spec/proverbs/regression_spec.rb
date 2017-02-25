describe 'Standard RSpec Example' do
  subject { 2 + 2 }

  context 'success' do
    specify { expect(subject).to eq(4) }
  end

  context 'failed' do
    # specify { expect(subject).to eq(5) }
    specify 'the above statement will accurately indicate failure' do
      expect {
        expect(2 + 2).to eq 5
      }.to raise_error RSpec::Expectations::ExpectationNotMetError
    end
  end

  context 'pending' do
    it 'should be pending'
  end
end
