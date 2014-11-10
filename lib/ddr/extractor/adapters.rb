module Ddr
  module Extractor
    module Adapters

      def self.get_text_extractor_adapter
        require_relative "adapters/#{Ddr::Extractor.text_extractor_adapter}_text_extractor_adapter"
        adapter_name = "#{Ddr::Extractor.text_extractor_adapter.to_s.capitalize}TextExtractorAdapter"
        klass = self.const_get(adapter_name.to_sym, false)
        klass.new
      end

    end
  end
end
