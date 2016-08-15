module RSpec
  class Command
    # module for using rspec-command in a spec
    #
    # @author autopp <autopp@gmail.com>
    #
    module DSL
      def self.included(cls)
        cls.include RSpec::Command::Matchers
      end

      def `(other)
        RSpec::Command.new(other)
      end
    end
  end
end
