module RSpec
  class Command
    module Matchers
      # Base class for a matcher class
      #
      # NOTE: This is a internal class
      #
      # @author atanimur <atanimur@yahoo-corp.jp>
      #
      class Base
        def matches?(actual)
          unless actual.is_a?(RSpec::Command)
            raise TypeError,
                  "expected RSpec::Command, but got #{actual.inspect}"
          end
          @actual = actual
          perform_match(actual.execute)
        end

        def actual_status
          @actual.status
        end

        def actual_status_message
          if actual_status.exited?
            "exited with status #{actual_status.exitstatus}"
          elsif actual_status.signaled?
            "terminated by signal #{actual_status.termsig}"
          else
            "been unknown status: #{@actual.inspect}"
          end
        end

        def make_expected_and_got_message(expected, got)
          "\n"\
          "expected: #{expected}\n"\
          "     got: #{got}"
        end
      end
    end
  end
end
