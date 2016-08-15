module RSpec
  class ShellCommand
    # Provide matcher methods
    #
    # @author autopp <autopp@gmail.com>
    #
    module Matchers
      def success
        Success.new
      end

      def exit_with(status)
        ExitWith.new(status)
      end

      def output(*args, &block)
        orig = super
        expected = args.first
        Output.new(expected, orig)
      end
    end
  end
end

require 'rspec/shell_command/matchers/base'
require 'rspec/shell_command/matchers/success'
require 'rspec/shell_command/matchers/exit_with'
require 'rspec/shell_command/matchers/output'
