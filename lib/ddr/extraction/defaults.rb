require "ddr-extraction"

BIN_DIR = File.expand_path("../../../../bin", __FILE__)
TIKA_VERSION = "1.6"
FITS_VERSION = "0.8.3"

Ddr::Extraction.configure do |config|
  config.adapters.text = :tika
  config.adapters.metadata = :fits

  config.tika.version = TIKA_VERSION
  config.tika.path = File.join(BIN_DIR, "tika-app.jar")
  config.tika.download_url = "http://archive.apache.org/dist/tika/tika-app-#{TIKA_VERSION}.jar"
  config.tika.checksum = "99df0d8c3f6a2be498d275053e611fb5afdf0a9d"
  config.tika.checksum_type = :SHA1

  config.fits.version = "0.8.3"
  config.fits.path = File.join(BIN_DIR, "fits-#{FITS_VERSION}", "fits.sh")
  config.fits.download_url = "http://projects.iq.harvard.edu/files/fits/files/fits-#{FITS_VERSION}.zip"
end

