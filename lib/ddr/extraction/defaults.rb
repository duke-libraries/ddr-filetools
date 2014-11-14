require "ddr-extraction"

bin_dir = File.expand_path("../../../../bin", __FILE__)

Ddr::Extraction.configure do |config|
  config.adapters.default = :tika
  config.adapters.tika.path = File.join(bin_dir, "tika-app.jar")
  config.adapters.fits.path = File.join(bin_dir, "fits", "fits.sh")
end

