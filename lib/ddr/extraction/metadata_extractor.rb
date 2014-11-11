require "ddr/extraction/adapters"

module Ddr
  module Extraction
    class MetadataExtractor
      extend Forwardable

      def_delegator :@adapter, :extract_metadata

      def initialize
        @adapter = Ddr::Extraction::Adapters.get_metadata_extraction_adapter
      end

    end
  end
end
