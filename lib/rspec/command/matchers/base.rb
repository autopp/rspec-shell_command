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
            raise TypeError, "expected RSpec::Command, but got #{actual.inspect}"
          end
          @actual = actual
          perform_match(actual.execute)
        end
      end
    end
  end
end
