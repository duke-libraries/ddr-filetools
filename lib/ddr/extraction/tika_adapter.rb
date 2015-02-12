require_relative "adapter"

module Ddr
  module Extraction
    class TikaAdapter < Adapter

      class << self
        # Path to tika-app.jar
        attr_accessor :tika_path
      end

      self.tika_path = File.join(File.expand_path("../../../../bin", __FILE__), "tika-app.jar")

      def text(file_path)
        call command(file_path, "--text")
      end

      def metadata(file_path)
        call command(file_path, "--metadata", "--xml")
      end

      private

      def command(file_path, *options)
        ["java", "-jar", self.class.tika_path, options, file_path].flatten
      end

    end
  end
end
