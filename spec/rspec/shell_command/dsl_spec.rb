require 'spec_helper'

describe RSpec::ShellCommand::DSL do
  context 'when RSpec::ShellCommand::DSL is included' do
    include RSpec::ShellCommand::DSL

    describe 'a backquote string' do
      subject { `echo hello` }
      it 'returns RSpec::ShellCommand' do
        expect(subject).to be_a(RSpec::ShellCommand)
      end

      it 'has not executed yet' do
        expect(subject).not_to be_executed
      end
    end

    describe '#success' do
      it 'returns the success matcher' do
        expect(`echo hello`).to success
      end
    end

    describe '#output' do
      it 'returns the custom output matcher' do
        expect(`echo hello`).to output("hello\n").to_stdout
      end
    end
  end

  context 'when RSpec::ShellCommand::DSL is not included' do
    describe 'a backquote string' do
      it 'returns stdout of given command' do
        expect(`echo hello`).to eq("hello\n")
      end
    end

    describe '#output' do
      it 'returns the builtin output matcher' do
        expect { puts 'hello' }.to output("hello\n").to_stdout
      end
    end
  end
end
