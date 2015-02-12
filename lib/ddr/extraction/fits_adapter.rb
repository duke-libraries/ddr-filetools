require_relative "adapter"

module Ddr
  module Extraction 
    class FitsAdapter < Adapter

      class << self
        # Path to FITS executable (fits.sh or fits.bat)
        attr_accessor :fits_path
      end

      self.fits_path = File.join(File.expand_path("../../../../bin", __FILE__), "fits", "fits.sh")

      def metadata(file_path)
        call command(file_path)
      end

      private

      def command(file_path)
        [self.class.fits_path, "-i", file_path]
      end

    end
  end
end

