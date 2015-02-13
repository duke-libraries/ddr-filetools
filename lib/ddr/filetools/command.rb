module Ddr
  module FileTools
    class Command

      attr_reader :provider

      def initialize(provider)
        @provider = provider
      end

      def call(file_path)
        raise NotImplementedError, "Subclasses must implement `call`."
      end

    end
  end
end
