require 'spec_helper'

describe 'success matcher' do
  include RSpec::ShellCommand::Matchers

  context 'when given a "echo hello"' do
    it 'matches' do
      expect(RSpec::ShellCommand.new('echo hello')).to success
    end
  end

  context 'when given a "echo goodbye; exit 1"' do
    it 'dose not matches' do
      expect(RSpec::ShellCommand.new('echo goodbye; exit 1')).not_to success
    end
  end
end
