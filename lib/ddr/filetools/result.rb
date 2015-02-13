module Ddr
  module FileTools
    class Result

      attr_reader :output, :error, :status

      def initialize(out, err, s)
        @output, @error, @status = out, err, s
      end

      def inspect
        "#<Ddr::FileTools::Result #{success? ? 'SUCCESS' : 'ERROR'}>"
      end

      def to_s
        output
      end

      def read
        output
      end

      def success?
        status.success?
      end

      def error?
        !success?
      end

    end
  end
end
