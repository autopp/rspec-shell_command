module RSpec
  class Command
    module Matchers
      # Provide implementation of success matcher
      #
      # Check whether given command successed
      #
      # @author atanimur <atanimur@yahoo-corp.jp>
      #
      class Success
        def matches?(actual)
          actual.execute.status.success?
        end
      end
    end
  end
end
