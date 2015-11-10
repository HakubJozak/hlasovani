require 'logger'
require 'pathname'
require 'smarter_csv'
require 'active_support'
require 'active_support/core_ext/module/delegation'

require_relative './multiIOLogger'
require_relative 'interp_ballot'
require_relative 'result'
require_relative 'interpelation'
require_relative 'state'

class Interp_parser
  DATA_DIR = Pathname.new("data")
 
  FILE_NAMES_INTERP = "poradi.unl"
  FILE_NAME_BALLOT = "li.unl"
  FILE_NAME_RESULT = "uitypv.unl"
  FILE_NAME_STATE = "p-stav.unl"
  FILE_NAMES = [FILE_NAMES_INTERP, FILE_NAME_BALLOT, FILE_NAME_RESULT, FILE_NAME_STATE]

  delegate :info, :error, to: :logger
  attr_reader :logger
  attr_accessor :in_interp
  attr_accessor :in_ballot
  attr_accessor :in_result
  attr_accessor :in_state

  # Set logger
  def initialize()
    log_file = File.open('../logs/interp_parser.log', 'a') 
    @logger = Logger.new MultiIOLogger.new(STDOUT, log_file)
  end

  # Load data from given files
  def load_data(filenames)   
    header = ['id_ballot', 'date_ballot', 'type_ballot', 'time_ballot', 'id_session', 'id_session_item', 'session', 'id_org']
    @in_ballot = smart_load(filenames[1], header)

    header = ['id_interp_result', 'text', 'priority']
    @in_result = smart_load(filenames[2], header)

    header = ['id_interp_result', 'id_interp_ballot', 'id_deputy', 'id_minister', 'long_text', 'priority_by_ballot', 'priority_by_author', 'short_text']
    @in_interp = smart_load_with1250_encoding(filenames[0], header)

    header = ['id_interp_result', 'id_type', 'steno']
    @in_state = smart_load(filenames[3], header)
  end

  # Load data from nonNULL columns
  def smart_load(filename, header)
    info("Loading of file " + filename + " started.")
    return SmarterCSV.process(filename, {:col_sep => "|", :row_sep => "\n", 
    :headers_in_file => false ,:user_provided_headers => header,
    })  # no block given
    info("Loading of file " + filename + " completed successfully.")
  end

def smart_load_with1250_encoding(filename, header)
    info("Loading of file " + filename + " started.")
    quote_chars = %w(" | ~ ^ & *)
    begin
      #File.open(filename, "r:windows-1250"),
      return SmarterCSV.process(File.open(filename, "r:windows-1250"), {:col_sep => "|", :row_sep => "\n", 
      :headers_in_file => false , quote_char: quote_chars.shift, :user_provided_headers => header,
      })  # no block given
    rescue CSV::MalformedCSVError
      quote_chars.empty? ? raise : retry 
    end
    info("Loading of file " + filename + " completed successfully.")
  end  

  # Process 4 data tables to 3 data objects according to schema/interp documentation
  def convert_inter_ballot_to_object
    ballots = [] 
    
    @in_ballot.each do |row|
      inter = Interp_ballot.new  
      inter.id_ballot = row[:id_ballot]
      inter.id_session_item = row[:id_session_item]
      inter.type_ballot =  row[:type_ballot]
      inter.time_ballot = row[:time_ballot]
      inter.id_session = row[:id_session]
      inter.date_ballot = row[:date_ballot]
      inter.session = row[:session]
      inter.id_org = row[:id_org]
      
      ballots << inter
    end
    info("Converting of data from files to objects Interp_ballot")
    ballots
  end

# Process 4 data tables to 3 data objects according to schema/interp documentation
  def convert_result_to_object
    results = [] 
    
    @in_result.each do |row|
      result = Result.new  
      result.id_interp_result = row[:id_interp_result]
      result.text = row[:text]
      result.priority =  row[:priority]
      
      results << result
    end
    info("Converting of data from files to objects Result.")
    results
  end

  # Process 4 data tables to 3 data objects according to schema/interp documentation
  def convert_interp_to_object
    interps = [] 
    
    # for no cant get together the 2 tables, unconsistence
    # @in_interp.zip(@in_state).each do |row_interp, row_state| 
    @in_interp.each do |row_interp|
      interp = Interpelation.new  
      interp.id_interp_result = row_interp[:id_interp_result] 
      interp.id_interp_ballot = row_interp[:id_interp_ballot]
      interp.id_deputy =  row_interp[:id_deputy]
      interp.id_minister = row_interp[:id_minister]
      interp.long_text = row_interp[:long_text]
      interp.priority_by_ballot = row_interp[:priority_by_ballot]
      interp.priority_by_author = row_interp[:priority_by_author]
      interp.short_text = row_interp[:short_text]

      #puts row_interp[:short_text]
      #interp.id_type = row_state[:id_type]
      #interp.steno = row_state[:steno]
      #puts interp 
      interps << interp
    end
    info("Converting of data from files to objects Interpelation.")
    #puts interps
    interps
  end

# Process 4 data tables to 3 data objects according to schema/interp documentation
  def convert_state_to_object
    states = [] 
    
    @in_state.each do |row|
      state = State.new  
      state.id_interp_result = row[:id_interp_result]
      state.id_type = row[:id_type]
      state.steno =  row[:steno]
      
      states << state
    end
    info("Converting of data from files to objects Result.")
    states
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
    ballots=ip.convert_inter_ballot_to_object

    results=ip.convert_result_to_object

    interps = ip.convert_interp_to_object

    states = ip.convert_state_to_object
   
    #tests
    #puts ballots
    #puts results
    puts interps
    #puts states
  end
end

Interp_parser.parse_all

