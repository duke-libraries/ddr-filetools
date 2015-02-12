require_relative "invoker"
require_relative "tika_adapter"
require_relative "fits_adapter"
require_relative "text_command"
require_relative "metadata_command"

module Ddr
  module Extraction
    class Client

      class << self
        attr_accessor :text_adapter, :metadata_adapter
      end

      self.text_adapter = TikaAdapter
      self.metadata_adapter = FitsAdapter

      attr_reader :invoker

      def text(file_path)
        Invoker.call(text_command, file_path)
      end


      def metadata(file_path)
        Invoker.call(metadata_command, file_path)
      end

      private

      def text_command
        TextCommand.new(text_adapter)
      end

      def text_adapter
        self.class.text_adapter.new
      end

      def metadata_command
        MetadataCommand.new(metadata_adapter)
      end

      def metadata_adapter
        self.class.metadata_adapter.new
      end

    end
  end
end
