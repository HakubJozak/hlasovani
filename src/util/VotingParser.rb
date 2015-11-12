require 'smarter_csv'
require_relative '../model/Check'
require_relative '../model/CheckDeputy'
require_relative '../model/Excuse'
require_relative '../model/IgnoredVoting'
require_relative '../model/Vote'
require_relative '../model/Voting'

class Parser
  
  def self.parseVoting(file_path)

    header = ['id', 'organ', 'meeting', 'number', 'point', 'date', 'time', 'agreeCnt', 'disagreeCnt', 'abstainCnt',
                'didNotVoteCnt', 'registeredCnt', 'quorum', 'votingType', 'result', 'longName', 'shortName']	  

    csv =  SmarterCSV.process(File.open(file_path, 'r:iso-8859-2:utf-8'), {
    	:headers_in_file => false, 
    	:col_sep => "|", 
    	:user_provided_headers => header
    })

    voting = [] 
    
    csv.each do |row|
      v = Voting.new
      v.id = row[:id]
      v.organ = row[:organ]
      v.meeting = row[:meeting]
      v.number = row[:number]
      v.point = row[:point]
      v.date = row[:date]
      v.time = row[:time]
      v.agreeCnt = row[:agreeCnt]
      v.disagreeCnt = row[:disagreeCnt]
      v.abstainCnt = row[:abstainCnt]
      v.didNotVoteCnt = row[:didNotVoteCnt]
      v.registeredCnt = row[:registeredCnt]
      v.quorum = row[:quorum]
      v.votingType = row[:votingType]
      v.result = row[:result]
      v.longName = row[:longName]
      v.shortName = row[:shortName]
      voting << v
    end  

  end

  def self.parseVotes(file_path)  

    header = ['deputy', 'voting', 'result']	  

    csv =  SmarterCSV.process(File.open(file_path, 'r:iso-8859-2:utf-8'), {
    	:headers_in_file => false, 
    	:col_sep => "|", 
    	:user_provided_headers => header
    }) 
    
    votes = []

    csv.each do |row|
      v = Vote.new	
      v.deputy = row[:deputy]
      v.voting = row[:voting]
      v.result = row[:result]
      votes << v
    end  

  end

  def self.parseExcuses(file_path)  

    header = ['organ', 'deputy', 'day', 'from', 'to']	  

    csv =  SmarterCSV.process(File.open(file_path, 'r:iso-8859-2:utf-8'), {
    	:headers_in_file => false, 
    	:col_sep => "|", 
    	:user_provided_headers => header
    })

    excuses = [] 
    
    csv.each do |row|
      e = Deputy.new	
      e.organ = row[:organ]
      e.deputy = row[:deputy]
      e.day = row[:day]
      e.from = row[:from]
      e.to = row[:to]

      excuses << e
    end  

  end

  def self.parseDeputy(file_path)  

    header = ['id', 'person', 'election_region', 'election_party', 'election_period', 'web', 'street', 
              'city', 'postal_code', 'email', 'telefon', 'fax', 'psp_telefon', 'facebook', 'foto']   

    csv =  SmarterCSV.process(File.open(file_path, 'r:iso-8859-2:utf-8'), {
      :headers_in_file => false, 
      :col_sep => "|", 
      :user_provided_headers => header
    })

    deputies = [] 
    
    csv.each do |row|
      d = Deputy.new  
      d.id = row[:id]
      d.person = row[:person]
      d.election_region = row[:election_region]
      d.election_party = row[:election_party]
      d.election_period = row[:election_period]
      d.web = row[:web]
      d.street = row[:street]
      d.city = row[:city]
      d.postal_code = row[:postal_code]
      d.email = row[:email]
      d.telefon = row[:telefon]
      d.fax = row[:fax]
      d.psp_telefon = row[:psp_telefon]
      d.facebook = row[:facebook]
      d.foto = row[:foto]

      deputies << d
    end  

  end

   def self.parseIgnoredVoting(file_path)  

    header = ['voting']

    csv =  SmarterCSV.process(File.open(file_path, 'r:iso-8859-2:utf-8'), {
      :headers_in_file => false, 
      :col_sep => "|", 
      :user_provided_headers => header
    })

    ignored_voting = [] 
    
    csv.each do |row|
      iv = Deputy.new  
      iv.voting = row[:voting]
      ignored_voting << iv
    end  

  end
  
  def self.parseCheck(file_path)  

    header = ['voting', 'turn', 'mode', 'requestVoting', 'retryVoting']   

    csv =  SmarterCSV.process(File.open(file_path, 'r:iso-8859-2:utf-8'), {
      :headers_in_file => false, 
      :col_sep => "|", 
      :user_provided_headers => header
    })

    checks = [] 
    
    csv.each do |row|
      c = Check.new 
      c.voting = row[:voting]
      c.turn = row[:turn]
      c.mode =  row[:mode]
      c.requestVoting = row[:requestVoting]
      c.retryVoting = row[:retryVoting]

      checks << c     
    end  

  end

  def self.parseCheckDeputy(file_path)  

    header = ['voting', 'person', 'mode']   

    csv =  SmarterCSV.process(File.open(file_path, 'r:iso-8859-2:utf-8'), {
      :headers_in_file => false, 
      :col_sep => "|", 
      :user_provided_headers => header
    })

    checksDeputy = [] 
    
    csv.each do |row|
      c = CheckDeputy.new 
      c.voting = row[:voting]
      c.person = row[:person]
      c.mode =  row[:mode]

      checksDeputy << c     
    end  

  end

end

# TODO resolve binding - for example: a deputy has reference to a person, but now is stored id of person