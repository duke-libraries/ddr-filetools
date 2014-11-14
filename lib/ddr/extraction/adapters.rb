require_relative "adapters/registry"

module Ddr
  module Extraction
    module Adapters

      class << self
        
        # Accessor for the name of the default adapter
        attr_accessor :default

        # Return the requested adapter by name.
        #   If a name is not supplied, return the default adapter.
        # @see .get_default_adapter
        #
        # @param adapter_name [Symbol] the name of the requested adapter.
        # @return [Class] the adapter class requested.
        def get_adapter(adapter_name = nil)
          if adapter_name
            Registry.instance.adapters[adapter_name.to_sym]
          else
            get_default_adapter
          end
        end

        # Return the default adapter.
        # Raises an exception if the default adapter has not been configured.
        def get_default_adapter
          raise "The default adapter has not been configured." unless default
          get_adapter(default)
        end

        # Registers an adapter.
        # @see Registry#register
        #
        # @param name [Symbol] the name of the adapter.
        # @param adapter [Class] the adapter class to register.
        def register(name, adapter)
          Registry.instance.register(name, adapter)
        end

        # Creates methods to access each adapter.
        Registry.instance.adapters.each do |name, adapter|
          define_method(name) do
            adapter
          end
        end

        def method_missing(name, *args)
          return get_adapter(name) if Registry.instance.adapters.key?(name.to_sym)
          super
        end
      end

    end
  end
end

Dir[File.join(__dir__, "adapters", "*_adapter.rb")].each { |adapter| require(adapter) }
