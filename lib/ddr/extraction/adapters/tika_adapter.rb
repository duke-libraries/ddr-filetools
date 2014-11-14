require_relative "adapter"

module Ddr
  module Extraction
    module Adapters
      class TikaAdapter < Adapter

        register :tika

        class << self
          # Path to tika-app.jar
          attr_accessor :path

          # Tika server port (optional, required for server)
          attr_accessor :port
        end  

        private

        def command(output, file_path)
          ["java", "-jar", self.class.path, output_options(output), file_path].flatten
        end

        def output_options(output)
          case output
          when :text
            "--text"
          when :metadata
            ["--metadata", "--xml"]
          end
        end

      end

    end
  end
end
