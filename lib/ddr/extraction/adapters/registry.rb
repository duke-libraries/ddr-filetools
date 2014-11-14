require "singleton"
require_relative "adapter"

module Ddr
  module Extraction
    module Adapters
      #
      # Registry of adapter names and classes
      #
      class Registry
        include Singleton

        attr_reader :adapters

        def initialize
          @adapters = {}
        end

        # Registers an adapter
        #
        # @param name [Symbol] the name of the adapter.
        # @param adapter [Class] the adapter to be registered.
        def register(name, adapter)
          name = name.to_sym
          validate!(name, adapter)
          adapters[name] = adapter
        end

        private

        def validate!(name, adapter)
          raise "Another adapter is registered under the name :#{name}." if adapters.key?(name)
          unless adapter < Adapter
            raise ArgumentError, "Only subclasses of Ddr::Extraction::Adapters::Adapter may be registered." 
          end
          raise "The adapter #{adapter.to_s} is already registered." if adapters.value?(adapter)
        end
      end

    end
  end
end
