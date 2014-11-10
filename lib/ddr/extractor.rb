require "ddr/extractor/version"
require "ddr/extractor/text_extractor"

require "active_support/core_ext/module/attribute_accessors"

module Ddr
  module Extractor

    # Tika version 
    mattr_accessor :tika_version do
      "1.6"
    end

    # Path to tika-app-{version}.jar
    mattr_accessor :tika_path do
      File.expand_path("../../../bin/tika-app-#{tika_version}.jar", __FILE__)
    end

    # Text extractor adapter name
    mattr_accessor :text_extractor_adapter do
      :tika
    end

  end
end
