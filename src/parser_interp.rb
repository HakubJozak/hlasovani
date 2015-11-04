require 'logger'
require 'pathname'
require 'smarter_csv'

class Interp_parser
  DATA_DIR = Pathname.new("data")
 
  FILE_NAMES_INTERP = "poradi.unl"
  FILE_NAME_BALLOT = "li.unl"
  FILE_NAME_RESULT = "uitypv.unl"
  FILE_NAME_STATE = "p-stav.unl"
  FILE_NAMES = [FILE_NAMES_INTERP, FILE_NAME_BALLOT, FILE_NAME_RESULT, FILE_NAME_STATE]

#  delegate :info, :error, to: :logger
  attr_reader :logger

  # Set logger
  def initialize()
    log_file = File.open('logs/interp_parser.log', 'a') 
    @logger = Logger.new MultiIOLogger.new(STDOUT, log_file)
  end

  # Load data from given files
  def load_data(filenames)   
    @in_interp = smart_load(filenames[0])
    @in_ballot = smart_load(filenames[1])
    @in_result = smart_load(filenames[2])
    @in_state = smart_load(filenames[3])
  end

  # Load data from nonNULL columns
  def smart_load(filename)
    info("Loading of file " + filename + " started.")
    SmarterCSV.process(filename, {:col_sep => "|", :row_sep => "\n"})  # no block given
    info("Loading of file " + filename + " completed successfully.")
  end

  # Process 4 data tables to 3 data objects according to schema/interp documentation
  def convert_data_to_objects
    # TODO
    # @out_interp = 
    # @out_interp_ballot =
    # @out_interp_result = 
    info("Converting of data from files to objects NOT YET IMPLEMENTED.")
  end

  # Save final objects
  def save_objects
    # TODO
    # save @out_interp, @out_interp_ballot and @out_interp_result
    info("Saving of objects NOT YET IMPLEMENTED.")
  end

#----
  def self.parse_all
    ip = Interp_parser.new()
    ip.load_data(FILE_NAMES)
    ip.convert_data_to_objects
    ip.save_objects
  end
end


Interp_parser.parse_all
