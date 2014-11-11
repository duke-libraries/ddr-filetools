require "ddr/extraction/version"
require "ddr/extraction/text_extractor"

require "active_support/core_ext/module/attribute_accessors"

module Ddr
  module Extraction

    # Tika version 
    mattr_accessor :tika_version do
      "1.6"
    end

    # Path to tika-app-{version}.jar
    mattr_accessor :tika_path do
      File.expand_path("../../../bin/tika-app-#{tika_version}.jar", __FILE__)
    end

    mattr_accessor :tika_download do
      "http://archive.apache.org/dist/tika/tika-app-#{tika_version}.jar"
    end

    mattr_accessor :tika_checksum do
      "http://archive.apache.org/dist/tika/tika-app-#{tika_version}.jar.sha"
    end

    mattr_accessor :tika_checksum_type do
      "SHA1"
    end

    # Text extraction adapter name
    mattr_accessor :text_extraction_adapter do
      :tika
    end

    mattr_accessor :fits_version do
      "0.8.3"
    end
    
    # Path to fits script (fits.sh or fits.bat)
    mattr_accessor :fits_path do
      File.expand_path("../../../bin/fits-#{fits_version}/fits.sh", __FILE__)
    end

    mattr_accessor :fits_download do
      "http://projects.iq.harvard.edu/files/fits/files/fits-#{fits_version}.zip"
    end

    mattr_accessor :metadata_extraction_adapter do
      :fits
    end

  end
end
