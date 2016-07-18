describe RSpec::Command::Matchers do
  context 'when moudle is included' do
    include RSpec::Command::Matchers

    describe '#success' do
      it 'returns Matchers::Success' do
        expect(success).to be_a(RSpec::Command::Matchers::Success)
      end
    end

    describe '#exit_with' do
      it 'returns Matchers::ExitWith' do
        expect(exit_with(0)).to be_a(RSpec::Command::Matchers::ExitWith)
      end
    end
  end
end
