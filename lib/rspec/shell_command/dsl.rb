module RSpec
  class ShellCommand
    # The module for using rspec-shell_command's DSL in a spec
    #
    # @author autopp <autopp@gmail.com>
    #
    module DSL
      def self.included(cls)
        cls.include RSpec::ShellCommand::Matchers
      end

      def `(other)
        RSpec::ShellCommand.new(other)
      end
    end
  end
end
