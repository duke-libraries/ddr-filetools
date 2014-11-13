require_relative "extraction/version"
require_relative "extraction/configuration"
require_relative "extraction/extractor"

module Ddr
  #
  # Ddr::Extraction - A file text and metadata extraction service.
  #
  module Extraction

    class << self

      def config
        @config ||= Configuration.new
      end

      # Yields a configuration object for the service
      def configure
        yield config
      end
      
    end

  end
end

