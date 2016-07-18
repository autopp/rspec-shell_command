module RSpec
  class Command
    module Matchers
      # Provide implementation of exit_with matcher
      #
      # Check whether given command exit with expected status
      #
      # @author autopp <autopp@gmail.com>
      #
      class ExitWith
        def initialize(status)
          unless status.is_a?(Integer)
            raise TypeError, "expected Integer, but got #{status.inspect}"
          end
          @status = status
        end

        def matches?(actual)
          actual_status = actual.execute.status
          actual_status.exitstatus == @status
        end
      end
    end
  end
end
