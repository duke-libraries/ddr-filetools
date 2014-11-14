module Ddr
  module Extraction
    module Adapters
      class Adapter

        # Supported extraction output types
        OUTPUT_TYPES = [:text, :metadata]

        class << self
          # Register the adapter
          def register(adapter_name)
            Ddr::Extraction::Adapters.register(adapter_name, self)
          end
        end

        # Extract a kind of output from the file path
        #
        # @param output [Symbol] the kind of output, `:text` or `:metadata`
        # @param file_path [String] path to the file to be processed
        # @return [IO] the result of the extraction
        # @api public
        def extract(output, file_path)
          raise ArgumentError, "Output type must be one of #{OUTPUT_TYPES}." unless OUTPUT_TYPES.include?(output)
          raise IOError, "File not found: #{file_path}" unless File.exist?(file_path)
          execute(command(output, file_path))
        end

        private

        # Returns the command to be executed
        #
        # @param output [Symbol] the kind of output.
        # @param file_path [String] path to the file to be processed.
        # @return [String, Array] the command as a String or Array
        # @see #extract
        # @see #execute
        # @api private
        def command(output, file_path)
          raise NotImplementedError, "The `command' instance method must be implemented by the adapter."
        end

        # Executes the command in a subprocess.
        #
        # @param cmd [String, Array] the command as a String or Array
        # @see Ruby documentation for IO.popen
        # @return [IO] the output of the command.
        # @api private
        def execute(cmd)
          IO.popen(cmd)
        end
        
      end
    end
  end
end
