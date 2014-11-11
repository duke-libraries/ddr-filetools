module Ddr
  module Extraction
    class Extractor
      extend Forwardable

      def_delegator :text_extractor, :extract_text
      def_delegator :metadata_extractor, :extract_metadata

      def extract(type, file)
        send("extract_#{type}", file)
      end

      private

      def text_extractor
        @text_extractor ||= TextExtractor.new
      end

      def metadata_extractor
        @metadata_extractor ||= MetadataExtractor.new
      end

    end
  end
end
