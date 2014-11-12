require "ddr/extraction/version"
require "ddr/extraction/adapters"
require "ddr/extraction/extractor"

module Ddr
  #
  # Ddr::Extraction - A file text and metadata extraction service.
  #
  module Extraction

    class << self

      # Yields a configurable object for the named adapter.
      #
      # @param adapter [Symbol] the name of the adapter - e.g., `:tika`, `:fits`
      def configure_adapter(adapter, &block)
        yield Adapters.get_adapter(adapter)
      end

      # Returns the service adapters configuration
      def adapters
        Adapters.config
      end

      # TODO move somewhere ...
      def set_defaults
        bin_dir = File.expand_path("../../../bin", __FILE__)

        configure_adapter :tika do |tika|
          tika.version = "1.6"
          tika.path = File.join(bin_dir, "tika-app.jar")
          tika.download_url = "http://archive.apache.org/dist/tika/tika-app-#{tika.version}.jar"
          tika.checksum = "99df0d8c3f6a2be498d275053e611fb5afdf0a9d"
          tika.checksum_type = :SHA1
        end

        configure_adapter :fits do |fits|
          fits.version = "0.8.3"
          fits.path = File.join(bin_dir, "fits-#{fits.version}", "fits.sh")
          fits.download_url = "http://projects.iq.harvard.edu/files/fits/files/fits-#{fits.version}.zip"
        end

        adapters.text = :tika
        adapters.metadata = :fits
      end

    end

  end
end

Ddr::Extraction.set_defaults
