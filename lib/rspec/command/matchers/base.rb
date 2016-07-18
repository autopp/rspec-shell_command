module RSpec
  class Command
    module Matchers
      class Base
        def matches?(actual)
          unless actual.is_a?(RSpec::Command)
            raise TypeError, "expected RSpec::Command, but got #{actual.inspect}"
          end
          @actual = actual
          perform_match(actual)
        end
      end
    end
  end
end
