require "ddr-extraction"
require "openssl"

DOWNLOAD_DIR = File.absolute_path("tmp")

namespace :tika do
  desc "Download Tika app"
  task :download => :download_dir do
    tika_app = File.join(DOWNLOAD_DIR, "tika-app.jar")
    Ddr::Extraction::Adapters::TikaAdapter.config do |tika|
      puts "Downloading Tika app ... "
      system "curl -L #{tika.download_url} -o #{tika_app}"
      puts "Verifiying checksum ... "
      digest = OpenSSL::Digest.const_get(tika.checksum_type).new
      digest << File.read(tika.path)
      if digest.to_s == tika.checksum
        FileUtils.mv(tika_app, tika.path)
      else
        puts "Checksums do not match!"
      end
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
    fits_tool = File.join(DOWNLOAD_DIR, "fits.zip")
    Ddr::Extraction::Adapters::FitsAdapter.config do |fits|
      puts "Downloading FITS tool ... "
      system "curl -L #{fits.download_url} -o #{fits_tool}"
      # Unzip options: convert text files, force overwrite, extra quiet
      system "unzip -a -o -qq -d bin #{fits_tool}"
      FileUtils.chmod(0755, fits.path)
    end
  end
end

task :download_dir do
  FileUtils.mkdir(DOWNLOAD_DIR) unless Dir.exists?(DOWNLOAD_DIR)
end

