require_relative "adapter"
require_relative "adapters"

module Ddr
  module Extraction
    class Configuration

      def adapters(name)
        config = Adapters.get_adapter(name)
        yield config if block_given?
        config
      end

      def adapter
        config = Adapter
        yield config if block_given?
        config
      end

    end
  end
end
