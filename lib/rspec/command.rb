require 'rspec/command/version'
require 'open3'

module Rspec
  # Wrapper of external command
  #
  # @author atanimur <atanimur@yahoo-corp.jp>
  #
  class Command
    #
    # @param [String] wrapped command string
    #
    def initialize(command)
      @command = command.to_s
    end
  end
end
