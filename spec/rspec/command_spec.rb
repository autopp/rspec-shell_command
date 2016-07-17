require 'spec_helper'
require 'open3'

describe Rspec::Command do
  let(:echo_command) do
    described_class.new('echo hello; echo goodby >&2; exit 2')
  end

  describe '#execute' do
    it 'returns self' do
      expect(echo_command.execute).to eq(echo_command)
    end

    it 'executes given command only once' do
      expect(Open3).to receive(:capture3).once
      command = Rspec::Command.new('date +"%s"')
      command.execute
      first_stdout = command.stdout
      command.execute
      expect(command.stdout).to eq(first_stdout)
    end
  end

  describe '#execute!' do
    it 'returns self' do
      expect(echo_command.execute).to eq(echo_command)
    end

    it 'executes given command each called' do
      expect(Open3).to receive(:capture3).twice
      command = Rspec::Command.new('date +"%s"')
      command.execute!
      first_stdout = command.stdout
      command.execute!
      expect(command.stdout).not_to eq(first_stdout)
    end
  end

  describe '#stdout' do
    subject { echo_command.stdout }

    context 'when before execution' do
      it { is_expected.to be_nil }
    end

    context 'when after execution' do
      it 'returns standard output of given command' do
        echo_command.execute
        expect(subject).to eq("hello\n")
      end
    end
  end

  describe '#stderr' do
    subject { echo_command.stderr }

    context 'when before execution' do
      it { is_expected.to be_nil }
    end

    context 'when after execution' do
      it 'returns standard error of given command' do
        echo_command.execute
        expect(subject).to eq("goodby\n")
      end
    end
  end

  describe '#status' do
    subject { echo_command.status }

    context 'when before execution' do
      it { is_expected.to be_nil }
    end

    context 'when after execution' do
      it 'returns Process::Status which is result of exectution' do
        echo_command.execute
        expect(subject).to be_a(Process::Status)
        expect(subject.exitstatus).to eq(2)
      end
    end
  end
end
