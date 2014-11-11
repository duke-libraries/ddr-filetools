module Ddr
  module Extraction
    module Adapters

      def self.get_text_extraction_adapter
        require_relative "adapters/#{Ddr::Extraction.text_extraction_adapter}_text_extraction_adapter"
        adapter_name = "#{Ddr::Extraction.text_extraction_adapter.to_s.capitalize}TextExtractionAdapter"
        klass = self.const_get(adapter_name.to_sym, false)
        klass.new
      end
 
      def self.get_metadata_extraction_adapter
        require_relative "adapters/#{Ddr::Extraction.metadata_extraction_adapter}_metadata_extraction_adapter"
        adapter_name = "#{Ddr::Extraction.metadata_extraction_adapter.to_s.capitalize}MetadataExtractionAdapter"
        klass = self.const_get(adapter_name.to_sym, false)
        klass.new
      end

    end
  end
end
