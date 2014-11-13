module Ddr
  module Extraction
    module Adapters

      KNOWN_ADAPTERS = [:fits, :tika]

      class << self

        def get_adapter(adapter_name)
          require_relative "adapters/#{adapter_name}_adapter"
          class_name = "#{adapter_name.to_s.capitalize}Adapter"
          const_get(class_name.to_sym, false)
        end

        KNOWN_ADAPTERS.each do |adapter|
          define_method(adapter) do
            get_adapter(adapter)
          end
        end

      end

    end
  end
end
