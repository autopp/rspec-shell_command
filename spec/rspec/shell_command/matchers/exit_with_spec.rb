require 'spec_helper'

describe 'exit_with matcher' do
  include RSpec::ShellCommand::Matchers

  context 'when given a "echo hello"' do
    let(:command) { RSpec::ShellCommand.new('echo hello') }

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

    context 'and  when expected status is between 1 and 3' do
      it 'dose not match' do
        expect(command).not_to exit_with(a_value_between(1, 3))
      end
    end
  end

  context 'when given a "echo goodbye; exit 2"' do
    let(:command) { RSpec::ShellCommand.new('echo goodbye; exit 2') }

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

    context 'and  when expected status is between 1 and 3' do
      it 'matches' do
        expect(command).to exit_with(a_value_between(1, 3))
      end
    end
  end
end
