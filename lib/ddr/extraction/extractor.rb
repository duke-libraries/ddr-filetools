require_relative "adapters"

module Ddr
  module Extraction
    class Extractor
      extend Forwardable

      def_delegator :text_adapter, :extract_text
      def_delegator :metadata_adapter, :extract_metadata

      # Extracts a type of content from a file
      #
      # @param type [Symbol] the type of content to extract, `:text` or `:metadata`.
      # @param file [String] path to file from which to extract content.
      # @return 
      def extract(type, file)
        send("extract_#{type}", file)
      end      

      private

      def text_adapter
        @text_adapter ||= Adapters.build_adapter(:text)
      end

      def metadata_adapter
        @metadata_adapter ||= Adapters.build_adapter(:metadata)
      end

    end
  end
end
