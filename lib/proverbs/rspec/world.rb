module RSpec
  module Proverbs
    module World
      # RSpec's world is an internal container for global
      # non-configuration data.
      def shared_example_steps
        @shared_example_steps ||= {}
      end
    end
  end
end
