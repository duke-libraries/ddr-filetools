require_relative "adapter"

module Ddr
  module Extraction 
    module Adapters
      class FitsAdapter < Adapter

        register :fits

        class << self
          # Path to FITS executable (fits.sh or fits.bat)
          attr_accessor :path
        end

        private

        def command(output, file_path)
          raise "This adapter only supports :metadata output." unless output == :metadata
          [self.class.path, "-i", file_path]
        end

      end
    end
  end
end

