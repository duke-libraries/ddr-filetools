require_relative "filetools/version"
require_relative "filetools/client"
require_relative "filetools/tool"
require_relative "filetools/tika"
require_relative "filetools/fits"
require_relative "filetools/text_command"
require_relative "filetools/metadata_command"
require_relative "filetools/ocr_command"

module Ddr
  module FileTools

    class << self
      def tools
        @tools ||= {}
      end

      def register(tool_name, opts)
        tools[tool_name] = Tool.new(opts)
      end
    end

    register :text, command: TextCommand, provider: Tika
    register :metadata, command: MetadataCommand, provider: Fits
    register :ocr, command: OcrCommand, provider: Tika

  end
end

