describe RSpec::Command::Matchers do
  context 'when moudle is included' do
    include RSpec::Command::Matchers

    describe '#success' do
      it 'returns Matchers::Success' do
        expect(success).to be_a(RSpec::Command::Matchers::Success)
      end
    end
  end
end
