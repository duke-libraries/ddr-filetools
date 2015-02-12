module Ddr
  module Extraction
    class Result

      attr_reader :output, :error, :status

      def initialize(out, err, s)
        @output, @error, @status = out, err, s
      end

      def inspect
        "#<Ddr::Extraction::Result #{status.success? ? 'SUCCESS' : 'ERROR'}>"
      end

      def to_s
        output
      end

    end
  end
end
