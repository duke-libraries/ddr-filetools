require_relative "command"

module Ddr
  module FileTools
    class TextCommand < Command

      def call(file_path)
        provider.text(file_path)
      end

    end
  end
end

      
