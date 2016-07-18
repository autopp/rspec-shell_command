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
    end
  end
end

require 'rspec/command/matchers/success'
