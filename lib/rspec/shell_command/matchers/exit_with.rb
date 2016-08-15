module RSpec
  class ShellCommand
    module Matchers
      # Provide implementation of exit_with matcher
      #
      # Check whether given command exit with expected status
      #
      # @author autopp <autopp@gmail.com>
      #
      class ExitWith < Base
        include RSpec::Matchers::Composable

        def initialize(status)
          @status = status
        end

        def perform_match(actual)
          actual_status = actual.status
          values_match?(@status, actual_status.exitstatus)
        end

        def failure_message
          make_expected_and_got_message(
            "exited with status #{@status}",
            actual_status_message
          )
        end

        def failure_message_when_negated
          make_expected_and_got_message(
            "not exited with status #{@status}",
            actual_status_message
          )
        end

        def description
          "exit with #{description_of(@status)}"
        end
      end
    end
  end
end
