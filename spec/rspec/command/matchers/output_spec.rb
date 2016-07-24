require 'spec_helper'
require 'rspec/matchers/fail_matchers'

describe 'output matcher' do
  include RSpec::Matchers::FailMatchers

  context 'when RSpec::Command::Matchers is included' do
    include RSpec::Command::Matchers

    context 'and when given a Command "echo hello; echo goodby >&2"' do
      let(:command) { RSpec::Command.new('echo hello; echo goodby >&2') }

      context 'and when expected stdout is "hello\n"' do
        it 'matches' do
          expect(command).to output("hello\n").to_stdout
        end
      end

      context 'and when expected stderr is "goodby\n"' do
        it 'matches' do
          expect(command).to output("goodby\n").to_stderr
        end
      end

      context 'and when expected stdout is /ell/' do
        it 'matches' do
          expect(command).to output(/ell/).to_stdout
        end
      end

      context 'and when expected stderr is /odb/' do
        it 'matches' do
          expect(command).to output(/odb/).to_stderr
        end
      end

      context 'and when expected stdout is "goodby\n"' do
        it 'not dose match' do
          expect(command).not_to output("goodby\n").to_stdout
        end
      end

      context 'and when expected stderr is "hello\n"' do
        it 'dose not match' do
          expect(command).not_to output("hello\n").to_stderr
        end
      end

      context 'and when expected stdout is /odb/' do
        it 'dose not match' do
          expect(command).not_to output(/odb/).to_stdout
        end
      end

      context 'and when expected stderr is /ell/' do
        it 'dose not match' do
          expect(command).not_to output(/ell/).to_stderr
        end
      end

      context 'and matcher dose not chain to any stream' do
        it 'fails' do
          expect { expect(command).to output("hello\n") }.to fail
        end
      end
    end

    context 'and when given block' do
      it 'matches by builtin output matcher' do
        expect { print('hello world') }.to output(/hello/).to_stdout
        expect { $stderr.print('goodby world') }.to output(/goodby/).to_stderr
      end
    end
  end

  context 'when RSpec::Command::Matchers is not included' do
    it 'output matcher is the builtin' do
      expect(output('hello')).to be_a(RSpec::Matchers::BuiltIn::Output)
    end
  end
end
