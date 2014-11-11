require_relative "text_extraction_adapter"

module Ddr
  module Extraction
    module Adapters
      class TikaTextExtractionAdapter < TextExtractionAdapter

        def extract_text(file)
          `java -jar #{Ddr::Extraction.tika_path} --text #{file}`
        end

      end
    end
  end
end

