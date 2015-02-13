module Ddr
  module FileTools
    class Tool

      attr_reader :command, :provider

      def initialize(opts)
        @command = opts.fetch(:command)
        @provider = opts.fetch(:provider)
      end

      def call(*args)
        build_command.call(*args)
      end

      private

      def build_command
        command.new(provider.new)
      end

    end
  end
end
