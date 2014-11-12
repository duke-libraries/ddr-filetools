require "ddr-extraction"

BIN_DIR = File.expand_path("../../../../bin", __FILE__)
TIKA_VERSION = "1.6"
FITS_VERSION = "0.8.3"

Ddr::Extraction.configure do |config|
  config.adapter.text = :tika
  config.adapter.metadata = :fits

  config.adapters(:tika) do |tika|
    tika.version = TIKA_VERSION
    tika.path = File.join(BIN_DIR, "tika-app.jar")
    tika.download_url = "http://archive.apache.org/dist/tika/tika-app-#{TIKA_VERSION}.jar"
    tika.verify_checksum = true
    tika.checksum_value = "99df0d8c3f6a2be498d275053e611fb5afdf0a9d"
    tika.checksum_type = :SHA1
  end

  config.adapters(:fits) do |fits|
    fits.version = "0.8.3"
    fits.path = File.join(BIN_DIR, "fits-#{FITS_VERSION}", "fits.sh")
    fits.download_url = "http://projects.iq.harvard.edu/files/fits/files/fits-#{FITS_VERSION}.zip"
  end
end

