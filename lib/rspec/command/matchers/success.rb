module RSpec
  class Command
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
      end
    end
  end
end
