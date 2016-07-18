require 'spec_helper'

describe RSpec::Command::Matchers::Base do
  let(:matcher) do
    ::Class.new(RSpec::Command::Matchers::Base) do
      def perform_match(_actual)
        true
      end
    end.new
  end

  describe '#matches?' do
    context 'with object which is not a Command' do
      it 'raise TypeError' do
        expect { matcher.matches?(Object.new) }.to raise_error(TypeError)
      end
    end

    context 'with a Command' do
      let(:command) { RSpec::Command.new('exit 0') }

      it 'invokes #perform_match with given command and returns its result' do
        expect(matcher).to receive(:perform_match)
          .with(command).and_call_original.once
        expect(matcher.matches?(command)).to eq(true)
      end

      it 'execute given command' do
        matcher.matches?(command)
        expect(command).to be_executed
      end

      it 'stores given argument to @actual' do
        matcher.matches?(command)
        expect(matcher.instance_variable_get(:@actual)).to eq(command)
      end
    end
  end
end
