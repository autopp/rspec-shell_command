module RSpec
  class Command
    module Matchers
      # Provide implementation of exit_with matcher
      #
      # Check whether given command exit with expected status
      #
      # @author autopp <autopp@gmail.com>
      #
      class ExitWith < Base
        def initialize(status)
          unless status.is_a?(Integer)
            raise TypeError, "expected Integer, but got #{status.inspect}"
          end
          @status = status
        end

        def perform_match(actual)
          actual_status = actual.status
          actual_status.exitstatus == @status
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
      end
    end
  end
end
