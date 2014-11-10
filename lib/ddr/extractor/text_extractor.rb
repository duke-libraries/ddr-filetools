require "ddr/extractor/adapters"

module Ddr
  module Extractor
    class TextExtractor
      extend Forwardable

      def_delegator :@adapter, :extract_text

      def initialize
        @adapter = Ddr::Extractor::Adapters.get_text_extractor_adapter
      end

    end
  end
end
