require_relative "command"

module Ddr
  module FileTools
    class MetadataCommand < Command

      def call(file_path)
        provider.metadata(file_path)
      end

    end
  end
end

      
