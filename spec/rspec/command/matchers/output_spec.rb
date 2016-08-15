require 'spec_helper'
require 'rspec/matchers/fail_matchers'

describe 'output matcher' do
  include RSpec::Matchers::FailMatchers

  context 'when RSpec::Command::Matchers is included' do
    include RSpec::Command::Matchers

    context 'and when given a Command "echo hello; echo goodbye >&2"' do
      let(:command) { RSpec::Command.new('echo hello; echo goodbye >&2') }

      context 'and when expected stdout is "hello\n"' do
        it 'matches' do
          expect(command).to output("hello\n").to_stdout
        end
      end

      context 'and when expected stderr is "goodbye\n"' do
        it 'matches' do
          expect(command).to output("goodbye\n").to_stderr
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

      context 'and when expected stdout is a starting with "hel"' do
        it 'matches' do
          expect(command).to output(a_string_starting_with('hel')).to_stdout
        end
      end

      context 'and when expected stderr is a starting with "goo"' do
        it 'matches' do
          expect(command).to output(a_string_starting_with('goo')).to_stderr
        end
      end

      context 'and when expected stdout is "goodbye\n"' do
        it 'dose not match' do
          expect(command).not_to output("goodbye\n").to_stdout
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

      context 'and when expected stdout is a starting with "goo"' do
        it 'dose not match' do
          expect(command).not_to output(a_string_starting_with('goo')).to_stdout
        end
      end

      context 'and when expected stderr is a starting with "hel"' do
        it 'dose not match' do
          expect(command).not_to output(a_string_starting_with('hel')).to_stderr
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
        expect { $stderr.print('goodbye world') }.to output(/goodbye/).to_stderr
      end
    end
  end

  context 'when RSpec::Command::Matchers is not included' do
    it 'output matcher is the builtin' do
      expect(output('hello')).to be_a(RSpec::Matchers::BuiltIn::Output)
    end
  end
end
