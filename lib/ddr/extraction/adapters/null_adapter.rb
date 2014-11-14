require_relative "adapter"

module Ddr
  module Extraction
    module Adapters
      class NullAdapter < Adapter

        register :null

        private

        def command(output, file_path)
          "echo"
        end

      end

    end
  end
end

