require_relative "adapters"

module Ddr
  module Extraction
    class Configuration

      # Returns the adapters module.
      #
      # @return [Module] the adapters module.
      def adapters
        Adapters
      end

    end
  end
end
