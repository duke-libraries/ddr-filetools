require_relative "command"

module Ddr
  module Extraction
    class TextCommand < Command

      def call(file_path)
        adapter.text(file_path)
      end

    end
  end
end

      
