module RSpec
  class ShellCommand
    module Matchers
      # Provide implementation of success matcher
      #
      # Check whether given command successed
      #
      # @author autopp <autopp@gmail.com>
      #
      class Success < Base
        def perform_match(actual)
          actual.status.success?
        end

        def failure_message
          "expect command have to successed, but #{actual_status_message}"
        end

        def failure_message_when_negated
          'expect command have not to successed, but successed'
        end

        def description
          'success'
        end
      end
    end
  end
end
