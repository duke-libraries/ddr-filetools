require_relative "command"

module Ddr
  module FileTools
    class OcrCommand < Command

      def call(file_path)
        provider.ocr(file_path)
      end

    end
  end
end

      
