module Ddr
  module Extraction
    class Command

      attr_reader :adapter

      def initialize(adapter)
        @adapter = adapter
      end

      def call(file_path)
        raise NotImplementedError, "Subclasses must implement `call`."
      end

    end
  end
end
