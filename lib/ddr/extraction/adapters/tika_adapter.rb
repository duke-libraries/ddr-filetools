require_relative "adapter"

module Ddr
  module Extraction
    module Adapters
      class TikaAdapter < Adapter

        # Extract text from file
        #
        # @param file [String] path to file from which to extract text
        # @return [IO] 
        def extract_text(file)
          IO.popen(["java", "-jar", self.class.path, "--text", file])
        end

        class << self
          # Tika version
          attr_accessor :version

          # Path to tika-app.jar
          attr_accessor :path

          # Base command
          attr_accessor :command

          # URL to download distribution
          attr_accessor :download_url

          # Tika distribution checksum
          attr_accessor :checksum

          # Tika distribution checksum type
          attr_accessor :checksum_type

          # Tika server port (optional, required for server)
          attr_accessor :port
        end          

      end
    end
  end
end