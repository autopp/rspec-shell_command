describe RSpec::ShellCommand::Matchers do
  context 'when moudle is included' do
    include RSpec::ShellCommand::Matchers

    describe '#success' do
      it 'returns Matchers::Success' do
        expect(success).to be_a(RSpec::ShellCommand::Matchers::Success)
      end
    end

    describe '#exit_with' do
      it 'returns Matchers::ExitWith' do
        expect(exit_with(0)).to be_a(RSpec::ShellCommand::Matchers::ExitWith)
      end
    end
  end
end
