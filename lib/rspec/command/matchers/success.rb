module RSpec
  class Command
    module Matchers
      class Success
        def matches?(actual)
          actual.execute.status.success?
        end
      end
    end
  end
end
