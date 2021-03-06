require 'rspec/shell_command/version'
require 'open3'

module RSpec
  # Wrapper of external command
  #
  # @author autopp <autopp@gmail.com>
  #
  class ShellCommand
    # @!attribute [r] stdout
    #   @return [String,nil]
    #     Standard output if given command is already executed, otherwise nil
    attr_reader :stdout

    # @!attribute [r] stderr
    #   @return [String]
    #     Standard error if given command is already executed, otherwise nil
    attr_reader :stderr

    # @!attribute [r] status
    #   @return [Process::Status]
    #     Status of given command if already executed, otherwise nil
    attr_reader :status

    #
    # @param [String] wrapped command string
    #
    def initialize(cmd)
      @cmd = cmd.to_s
      @stdout = @stderr = @status = nil
    end

    def execute
      execute! unless executed?
      self
    end

    def execute!
      @stdout, @stderr, @status = Open3.capture3(@cmd)
      self
    end

    def executed?
      !@status.nil?
    end
  end
end

require 'rspec/shell_command/matchers'
require 'rspec/shell_command/dsl'
