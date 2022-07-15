require 'open-uri'
require 'tempfile'
require 'fileutils'
require "logger"

FILE_DIR = ENV['SAVE_PATH'] || __dir__

def download(url, file_path=nil)
  file = Tempfile.new
  file.write URI.open(url).read
  if file.length > 0
    file_path ||= File.join(FILE_DIR, File.basename(url))
    FileUtils.cp(file.path, file_path)
  end
  file.close!
end

def downloads
  geoip_url = 'https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat'
  geosite_url = 'https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat'

  download(geoip_url)
  download(geosite_url)

  file = File.open(File.join(FILE_DIR, 'update.log'), 'a')
  file << "#{Time.now} updated \n"
  file.close
end

def runner
  logger = Logger.new('/proc/1/fd/1')
  begin
    retries ||= 0
    logger.info "try #{retries}, update geo data"
    downloads
  rescue => e
    logger.error e
    retry if (retries += 1) < 3
  end
end