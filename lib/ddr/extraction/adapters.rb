module Ddr
  module Extraction
    module Adapters

      def self.get_adapter(adapter_name)
        require_relative "adapters/#{adapter_name}_adapter"
        class_name = "#{adapter_name.to_s.capitalize}Adapter"
        const_get(class_name.to_sym, false)
      end      

    end
  end
end
