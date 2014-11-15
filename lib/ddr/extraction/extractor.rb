require "delegate"
require_relative "adapters"

module Ddr
  module Extraction
    #
    # The Extractor is the main public class.
    #
    # It works by delegating to an adapter that does the real work.
    #
    #     extractor = Ddr::Extraction::Extractor.build(:tika)
    #     text = extractor.extract(:text, "/path/to/text/file")
    #     puts text.read
    #     ...
    #
    class Extractor < ::SimpleDelegator

      class << self

        # Returns/yields an extractor instance
        #
        # @param adapter_name [Symbol] the name of the adapter to plug in.
        #        If not given, a default adapter will be used, if
        #        Ddr::Extraction::Adapters.default has been set with 
        #        the name of the default adapter.
        # 
        def build(adapter_name = nil)
          adapter = Adapters.get_adapter(adapter_name)
          extractor = new(adapter.new)
          if block_given?
            yield extractor
          else 
            extractor
          end
        end

      end

    end
  end
end
