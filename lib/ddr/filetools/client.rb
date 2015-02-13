module Ddr
  module FileTools
    class Client

      def run_tool(tool_name, *args)
        tool = Ddr::FileTools.tools.fetch(tool_name)
        tool.call(*args)
      end

    end
  end
end
