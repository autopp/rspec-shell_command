module RSpec
  class Command
    # Provide matcher methods
    #
    # @author autopp <autopp@gmail.com>
    #
    module Matchers
      def success
        Success.new
      end

      def exit_with(status)
        ExitWith.new(status)
      end
    end
  end
end

require 'rspec/command/matchers/base'
require 'rspec/command/matchers/success'
require 'rspec/command/matchers/exit_with'
