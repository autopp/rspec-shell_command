module RSpec
  class Command
    module Matchers
      # Provide implementation of success matcher
      #
      # Check whether given command successed
      #
      # @author autopp <autopp@gmail.com>
      #
      class Success
        def matches?(actual)
          actual.execute.status.success?
        end
      end
    end
  end
end
