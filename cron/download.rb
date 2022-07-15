require 'open-uri'
require 'tempfile'
require 'fileutils'
require "logger"

FILE_DIR = ENV['SAVE_PATH'] || __dir__
LOGDEV = ENV['LOGDEV'] || STDOUT

def logger
  $logger ||= Logger.new(LOGDEV)
end

def download(url, file_path=nil)
  logger.info("downloading #{url}")
  file = Tempfile.new
  file.write URI.open(url).read
  if file.length > 0
    file_path ||= File.join(FILE_DIR, File.basename(url))
    FileUtils.cp(file.path, file_path)
    logger.info("downloaded #{url}")
  else
    logger.error("download error for #{url}!")
  end
  file.close!
end

def downloads
  geoip_url = 'https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat'
  geosite_url = 'https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat'

  download(geoip_url)
  download(geosite_url)
end

def runner
  
  begin
    retries ||= 0
    logger.info "try #{retries}, update geo data"
    downloads
    logger.info "updated!!!"
  rescue => e
    logger.error e
    retry if (retries += 1) < 3
  end
end