require_relative "adapter"

module Ddr
  module Extraction 
    module Adapters
      class FitsAdapter < Adapter

        # Return metadata extracted from file
        #
        # @param file [String] the file from which to extract metadata.
        # @return [IO]
        def extract_metadata(file)
          IO.popen([self.class.path, "-i", file])
        end

        class << self
          # FITS version
          attr_accessor :version

          # Path to FITS executable (fits.sh or fits.bat)
          attr_accessor :path

          # URL to download distribution
          attr_accessor :download_url
        end

      end
    end
  end
end
