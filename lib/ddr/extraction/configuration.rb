require_relative "adapters"

module Ddr
  module Extraction
    class Configuration

      AdapterConfig = Struct.new(:text, :metadata)

      def adapters
        @adapter_config ||= AdapterConfig.new
      end

      def method_missing(name, *args)
        begin
          Adapters.get_adapter(name)
        rescue
          super
        end
      end

    end
  end
end
