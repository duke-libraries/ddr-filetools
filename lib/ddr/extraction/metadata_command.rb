require_relative "command"

module Ddr
  module Extraction
    class MetadataCommand < Command

      def call(file_path)
        adapter.metadata(file_path)
      end

    end
  end
end

      
