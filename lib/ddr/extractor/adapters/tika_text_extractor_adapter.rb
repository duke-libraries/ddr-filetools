require_relative "text_extractor_adapter"

module Ddr
  module Extractor
    module Adapters
      class TikaTextExtractorAdapter < TextExtractorAdapter

        def extract_text(file)
          `java -jar #{Ddr::Extractor.tika_path} --text #{file}`
        end

      end
    end
  end
end

