require_relative "adapters"

module Ddr
  module Extraction
    class Configuration

      # Returns an object have settable attributes for adapters.
      def adapters
        config = Adapters
        yield config if block_given?
        config
      end

    end
  end
end
