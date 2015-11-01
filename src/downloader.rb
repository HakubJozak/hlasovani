require 'open-uri'
require 'logger' 
require 'zip'
require 'pathname'
require 'active_support'
require 'active_support/core_ext/module/delegation'


#custom classes
require_relative './multiIOLogger'





class Downloader

  DATA_DIR = Pathname.new("data")
  DOWNLOAD_DIR = DATA_DIR.join("download")
  BASE_URL = "http://www.psp.cz/eknih/cdrom/opendata/"
  
  FILE_NAMES = [
    "poslanci.zip",
    "hl-2013ps.zip",
    "hl-2010ps.zip",
    "hl-2006ps.zip",
    "hl-2002ps.zip",
    "hl-1998ps.zip",
    "hl-1996ps.zip",
    "hl-1993ps.zip",
    "tisky.zip",
    "interp.zip",
    "sbirka.zip",
    "schuze.zip",
    "se_tisk.zip"
  ]

  delegate :info, :error, to: :logger
  attr_reader :logger

  def initialize(filename)
    log_file = File.open('logs/downloader.log', 'a') 
    @logger = Logger.new MultiIOLogger.new(STDOUT, log_file)
    @filename = filename
  end

  
  #download all files provided in the list to the download dir
  def download_file
    info("Downloading file " + @filename + " started.")
    
    open(local_file, 'wb') do |file|
      file << open(remote_file).read
    end

    info("Downloading file " + @filename + " completed successfully.")
  rescue StandardError => e
    error("Unable to download file #{@filename} due to following error occurred #{e}")
  end

  #unzips specified file to the data dir
  def unzip_file
    info("Extracting file #{@filename} started.")

    Zip::File.open(local_file) do |zip_file|
      zip_file.each do |f|
        info("Processing zipped file #{f}")
        f_path = File.join(DATA_DIR, f.name)
        FileUtils.mkdir_p(File.dirname(f_path))
        zip_file.extract(f, f_path) unless File.exist?(f_path)
      end
    end

    info("Extracting file #{@filename} completed successfully.")
  rescue StandardError => e
    error("Unable to unzip file #{@filename} due to following error occurred #{e}")
  end

  def self.get_all
    FILE_NAMES.each do |filename|
      d = Downloader.new(filename)
      d.download_file
      d.unzip_file
    end
  end

  private

  def local_file
    DOWNLOAD_DIR.join(@filename)
  end

  def remote_file
    "#{BASE_URL}/#{@filename}"
  end
  
end


Downloader.get_all


