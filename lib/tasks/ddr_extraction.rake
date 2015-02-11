require "ddr/extraction/defaults"
require "openssl"
require "net/http"

DOWNLOAD_DIR = File.absolute_path("tmp")
BIN_DIR = File.absolute_path("bin")
TIKA_VERSION = "1.7"
FITS_VERSION = "0.8.3"

tika_version = ENV["TIKA_VERSION"] || TIKA_VERSION
tika_path = Ddr::Extraction.config.adapters.tika.path
tika_app = File.basename(tika_path)
tika_download_url = "http://archive.apache.org/dist/tika/tika-app-#{tika_version}.jar"
tika_checksum_url = "#{tika_download_url}.sha"
tika_checksum_type = :SHA1

fits_version = ENV["FITS_VERSION"] || FITS_VERSION
fits_path = Ddr::Extraction.config.adapters.fits.path
fits_download_url = "http://projects.iq.harvard.edu/files/fits/files/fits-#{fits_version}.zip"

namespace :tika do
  desc "Download Tika app"
  task :download => [:download_dir] do
    FileUtils.cd(DOWNLOAD_DIR) do
      puts "Downloading Tika app ... "
      system "curl -L #{tika_download_url} -o #{tika_app}"
      checksum = Net::HTTP.get(URI(tika_checksum_url)).chomp
      puts "Verifiying checksum ... "
      digest = OpenSSL::Digest.const_get(tika_checksum_type).new
      digest << File.read(tika_app)
      if digest.to_s != checksum
        puts "Checksums do not match -- aborting!"
        FileUtils.remove_entry_secure(tika_app)
        abort
      end
      FileUtils.mv(tika_app, tika_path)
    end
  end

  # namespace :server do
  #   desc "Start the Tika server"
  #   task :start => :environment do      
  #   end
  # end
end

namespace :fits do
  desc "Download FITS tool"
  task :download => :download_dir do
    FileUtils.cd(DOWNLOAD_DIR) do
      puts "Downloading FITS tool ... "
      system "curl -L #{fits_download_url} -o fits.zip"
      system "unzip -a -o -q fits.zip"
      FileUtils.mv("fits-#{fits_version}", File.dirname(fits_path))
    end
    FileUtils.chmod(0755, fits_path)
  end
end

task :download_dir do
  FileUtils.mkdir(DOWNLOAD_DIR) unless Dir.exists?(DOWNLOAD_DIR)
end

