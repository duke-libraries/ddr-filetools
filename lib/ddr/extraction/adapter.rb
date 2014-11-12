require "delegate"
require_relative "adapters"

module Ddr
  module Extraction
    class Adapter < ::SimpleDelegator

      class << self
        # Accessors for adapter types
        attr_accessor :text, :metadata

        def build_adapter(type)
          adapter_name = send(type)
          adapter = Adapters.get_adapter(adapter_name)
          new(adapter.new)
        end
      end

    end
  end
end
