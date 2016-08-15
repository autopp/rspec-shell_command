require 'spec_helper'
require 'open3'
require 'fileutils'

describe RSpec::Command do
  shared_context 'command is "echo hoge >>tmp.txt"',
                 command: 'echo hoge >>tmp.txt' do
    let(:tmp_file) { 'tmp.txt' }
    let(:command) { described_class.new("echo hoge >>#{tmp_file}") }

    before do
      FileUtils.rm_f(tmp_file)
    end

    after do
      FileUtils.rm_f(tmp_file)
    end
  end

  shared_context 'command is "echo hello; echo goodbye >&2; exit 2"',
                 command: 'echo hello; echo goodbye >&2; exit 2' do
    let(:command) do
      described_class.new('echo hello; echo goodbye >&2; exit 2')
    end
  end

  describe '#execute', command: 'echo hoge >>tmp.txt' do
    it 'returns self' do
      expect(command.execute).to eq(command)
    end

    it 'executes given command only once' do
      expect(Open3).to receive(:capture3).once.and_call_original

      command.execute
      command.execute
      expect(File.read(tmp_file)).to eq("hoge\n")
    end
  end

  describe '#execute!', command: 'echo hoge >>tmp.txt' do
    it 'returns self' do
      expect(command.execute).to eq(command)
    end

    it 'executes given command each called' do
      expect(Open3).to receive(:capture3).twice.and_call_original

      command.execute
      command.execute!
      expect(File.read(tmp_file)).to eq("hoge\nhoge\n")
    end
  end

  describe '#stdout', command: 'echo hello; echo goodbye >&2; exit 2' do
    subject { command.stdout }

    context 'when before execution' do
      it { is_expected.to be_nil }
    end

    context 'when after execution' do
      it 'returns standard output of given command' do
        command.execute
        expect(subject).to eq("hello\n")
      end
    end
  end

  describe '#stderr', command: 'echo hello; echo goodbye >&2; exit 2' do
    subject { command.stderr }

    context 'when before execution' do
      it { is_expected.to be_nil }
    end

    context 'when after execution' do
      it 'returns standard error of given command' do
        command.execute
        expect(subject).to eq("goodbye\n")
      end
    end
  end

  describe '#status', command: 'echo hello; echo goodbye >&2; exit 2' do
    subject { command.status }

    context 'when before execution' do
      it { is_expected.to be_nil }
    end

    context 'when after execution' do
      it 'returns Process::Status which is result of exectution' do
        command.execute
        expect(subject).to be_a(Process::Status)
        expect(subject.exitstatus).to eq(2)
      end
    end
  end
end
