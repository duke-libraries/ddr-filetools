require "ddr/extraction/version"
require "ddr/extraction/configuration"
require "ddr/extraction/extractor"

module Ddr
  #
  # Ddr::Extraction - A file text and metadata extraction service.
  #
  module Extraction

    class << self

      attr_reader :config

      # Yields a configuration object for the service
      def configure
        @config ||= Configuration.new
        yield @config
      end

    end

  end
end

