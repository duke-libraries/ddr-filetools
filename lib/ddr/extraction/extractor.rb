module Ddr
  module Extraction
    # Receiver
    class Extractor

      def text(file_path)

      end

      def metadata(file_path)

      end

      # Extract a kind of output from the file path
      #
      # @param output [Symbol] the kind of output, `:text` or `:metadata`
      # @param file_path [String] path to the file to be processed
      # @return [IO] the result of the extraction
      # @api public
      def extract(output, file_path)
        raise IOError, "File not found: #{file_path}" unless File.exist?(file_path)
        adapters.send(output, file_path)
      end

    end
  end
end
