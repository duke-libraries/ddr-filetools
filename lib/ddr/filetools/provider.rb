require 'open3'
require_relative "result"

module Ddr
  module FileTools
    class Provider

      def call(cmd)
        out, err, s = Open3.capture3(*cmd)
        Result.new(out, err, s)
      end

    end
  end
end
