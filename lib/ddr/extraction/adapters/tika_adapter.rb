module Ddr
  module Extraction
    module Adapters
      class TikaAdapter

        # Extract text from file
        #
        # @param file [String] path to file from which to extract text
        # @return [IO] the output
        def extract_text(file)
          IO.popen(["java", "-jar", self.class.path, "--text", file])
        end

        class << self
          # Path to tika-app.jar
          attr_accessor :path

          # Tika server port (optional, required for server)
          attr_accessor :port
        end          

      end
    end
  end
end
