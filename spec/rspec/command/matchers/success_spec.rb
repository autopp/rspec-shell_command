require 'spec_helper'

describe 'success matcher' do
  include RSpec::Command::Matchers

  context 'when given a "echo hello"' do
    it 'passes' do
      expect(`echo hello`).to success
    end
  end

  context 'when given a "eho goodby; exit 1"' do
    it 'fails' do
      expect(`echo goodby; exit 1`).not_to success
    end
  end
end
