module Ddr
  module Extraction
    class Invoker

      def self.call(command, file_path)
        command.call(file_path)
      end

    end
  end
end
