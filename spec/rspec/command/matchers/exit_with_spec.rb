require 'spec_helper'

describe 'exit_with matcher' do
  include RSpec::Command::Matchers

  context 'when expected status is not Integer' do
    it 'raises error' do
      expect { exit_with('0') }.to raise_error(TypeError)
    end
  end

  context 'when given a "echo hello"' do
    let(:command) { RSpec::Command.new('echo hello') }

    context 'and when expected status is 0' do
      it 'matches' do
        expect(command).to exit_with(0)
      end
    end

    context 'and when expected status is 2' do
      it 'dose not match' do
        expect(command).not_to exit_with(2)
      end
    end
  end

  context 'when given a "echo goodby; exit 2"' do
    let(:command) { RSpec::Command.new('echo goodby; exit 2') }

    context 'and when expected status is 0' do
      it 'matches' do
        expect(command).not_to exit_with(0)
      end
    end

    context 'and when expected status is 2' do
      it 'dose not match' do
        expect(command).to exit_with(2)
      end
    end
  end
end
