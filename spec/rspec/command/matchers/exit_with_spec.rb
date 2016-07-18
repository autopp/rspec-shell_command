require 'spec_helper'

describe 'exit_with matcher' do
  include RSpec::Command::Matchers

  context 'when given a "echo hello"' do
    context 'and when expected status is 0' do
      it 'matches' do
        expect(RSpec::Command.new('echo hello')).to exit_with(0)
      end
    end

    context 'and when expected status is 2' do
      it 'dose not match' do
        expect(RSpec::Command.new('echo hello')).not_to exit_with(2)
      end
    end
  end

  context 'when given a "eho goodby; exit 2"' do
    context 'and when expected status is 0' do
      it 'matches' do
        expect(RSpec::Command.new('echo goodby; exit 2')).not_to exit_with(0)
      end
    end

    context 'and when expected status is 2' do
      it 'dose not match' do
        expect(RSpec::Command.new('echo goodby; exit 2')).to exit_with(2)
      end
    end
  end
end
