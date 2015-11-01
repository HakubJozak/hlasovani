#std libs
require 'open-uri'
require 'logger' 
require 'zip'

#custom classes
require './multiIOLogger'

log_file = File.open('../logs/downloader.log', 'a') 
$LOG = Logger.new MultiIOLogger.new(STDOUT, log_file)

DATA_DIR = "../data"
DOWNLOAD_DIR = DATA_DIR + "/download"


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


#download all files provided in the list to the download dir
def download_file(filename)
  $LOG.info("Downloading file " + filename + " started.")
  begin
    open(DOWNLOAD_DIR + "/" + filename, 'wb') do |file|
      file << open(BASE_URL + "/" + filename).read
    end
    $LOG.info("Downloading file " + filename + " completed successfully.")
  rescue StandardError => e
    $LOG.error("Unable to download file #{filename} due to following error occurred #{e}")
  end
end

#unzips specified file to the data dir
def unzip_file(filename)
  $LOG.info("Extracting file #{filename} started.")
  begin
    Zip::File.open(DOWNLOAD_DIR + "/" + filename) do |zip_file|
         zip_file.each do |f|
           $LOG.info("Processing zipped file #{f}")
           f_path=File.join(DATA_DIR, f.name)
           FileUtils.mkdir_p(File.dirname(f_path))
           zip_file.extract(f, f_path) unless File.exist?(f_path)
         end
       end
    $LOG.info("Extracting file #{filename} completed successfully.")
  rescue StandardError => e
    $LOG.error("Unable to unzip file #{filename} due to following error occurred #{e}")
  end
end


FILE_NAMES.each do |filename|
  download_file filename
  unzip_file filename
end
