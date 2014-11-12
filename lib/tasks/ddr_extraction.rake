require "ddr/extraction/defaults"
require "openssl"

DOWNLOAD_DIR = File.absolute_path("tmp")

namespace :tika do
  desc "Download Tika app"
  task :download => :download_dir do
    tika_app = File.join(DOWNLOAD_DIR, "tika-app.jar")
    tika_config = Ddr::Extraction.config.adapters(:tika)
    puts "Downloading Tika app ... "
    system "curl -L #{tika_config.download_url} -o #{tika_app}"
    if tika_config.verify_checksum
      puts "Verifiying checksum ... "
      digest = OpenSSL::Digest.const_get(tika_config.checksum_type).new
      digest << File.read(tika_config.path)
      if digest.to_s != tika_config.checksum_value
        puts "Checksums do not match -- aborting!"
        FileUtils.remove_entry_secure(tika_app)
        abort
      end
    end
    FileUtils.mv(tika_app, tika_config.path)
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
    fits_config = Ddr::Extraction.config.adapters(:fits)
    puts "Downloading FITS tool ... "
    system "curl -L #{fits_config.download_url} -o #{fits_tool}"
    # Unzip options: convert text files, force overwrite, extra quiet
    system "unzip -a -o -qq -d bin #{fits_tool}"
    FileUtils.chmod(0755, fits_config.path)
  end
end

task :download_dir do
  FileUtils.mkdir(DOWNLOAD_DIR) unless Dir.exists?(DOWNLOAD_DIR)
end

