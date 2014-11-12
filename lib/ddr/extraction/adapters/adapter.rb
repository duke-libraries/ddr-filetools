module Ddr
  module Extraction
    module Adapters
      class Adapter

        class << self
          def config
            yield self
          end
        end

      end
    end
  end
end
