module RSpec
  class Command
    module Matchers
      # Provide implementation of out matcher
      #
      # Check whether given command output expected string or pattern
      #   to stdout or stderr
      #
      # @author autopp <autopp@gmail.com>
      #
      class Output < Base
        include RSpec::Matchers::Composable

        def initialize(expected, orig)
          @expected = expected
          @orig = orig
        end

        def matches?(actual)
          @actual_is_command = actual.is_a?(Command)
          return @orig.matches?(actual) unless @actual_is_command

          @actual = actual.execute

          return false unless @stream == :stdout || @stream == :stderr

          if @expected
            values_match?(@expected, actual_output)
          else
            !actual_output.empty?
          end
        end

        def failure_message
          if @actual_is_command
            "expect command to #{description}"
          else
            @orig.failure_message
          end
        end

        def failure_message_when_negated
          if @actual_is_command
            "expect command to not #{description}"
          else
            @orig.failure_message_when_negated
          end
        end

        def supports_block_expectations?
          true
        end

        def to_stdout
          @stream = :stdout
          @orig.to_stdout
          self
        end

        def to_stderr
          @stream = :stderr
          @orig.to_stderr
          self
        end

        def description
          if @command
            "output #{description_of(@expected)} to #{@stream}"
          else
            "output to #{@stream}"
          end
        end

        private

        def actual_output
          case @stream
          when :stdout
            @actual.stdout
          when :stderr
            @actual.stderr
          end
        end
      end
    end
  end
end
