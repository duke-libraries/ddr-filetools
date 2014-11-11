require "ddr/extraction/adapters"

module Ddr
  module Extraction
    class TextExtractor
      extend Forwardable

      def_delegator :@adapter, :extract_text

      def initialize
        @adapter = Ddr::Extraction::Adapters.get_text_extraction_adapter
      end

    end
  end
end
