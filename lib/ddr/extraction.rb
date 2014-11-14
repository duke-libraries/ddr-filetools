require_relative "extraction/version"
require_relative "extraction/configuration"
require_relative "extraction/extractor"
require_relative "extraction/adapters"

module Ddr
  #
  # Ddr::Extraction - A pluggable content extraction service.
  #
  module Extraction

    class << self

      # Returns the service configuration
      def config
        @config ||= Configuration.new
      end

      # Yields the service configuration to a block
      def configure
        yield config
      end

      # Loads default configuration settings
      def load_defaults!
        require_relative "extraction/defaults"
      end

    end

  end
end

Dir[File.join(__dir__, "extraction", "adapters", "*_adapter.rb")].each { |adapter| require(adapter) }
