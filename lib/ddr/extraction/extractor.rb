require_relative "adapters"

module Ddr
  module Extraction
    class Extractor

      # Extracts a type of content from a file
      #
      # @param type [Symbol] the type of content to extract, `:text` or `:metadata`.
      # @param file [String] path to file from which to extract content.
      # @return [IO] the output
      def extract(type, file)
        adapter(type).send("extract_#{type}", file)
      end

      private

      def adapter(type)
        Adapter.build_adapter(type)
      end

    end
  end
end
