require 'smarter_csv'
require_relative '../model/Person'
require_relative '../model/Organ'
require_relative '../model/Function'
require_relative '../model/Deputy'

class Parser
  
  def self.parsePersons(file_path)  

    header = ['id', 'front_degree', 'last_name', 'first_name', 'back_degree', 'born_date', 'sex', 'last_edit', 'death_date']	  

    csv =  SmarterCSV.process(File.open(file_path, 'r:iso-8859-2:utf-8'), {
    	:headers_in_file => false, 
    	:col_sep => "|", 
    	:user_provided_headers => header
    })

    persons = [] 
    
    csv.each do |row|
      p = Person.new	
      p.id = row[:id]
      p.front_degree = row[:front_degree]
      p.first_name =  row[:first_name]
      p.last_name = row[:last_name]
      p.back_degree = row[:back_degree]
      p.born_date = Date.strptime(row[:born_date], '%d.%m.%Y') unless row[:born_date].nil?
      p.sex = row[:sex]
      p.last_edit = Date.strptime(row[:last_edit], '%d.%m.%Y') unless row[:last_edit].nil?
      p.death_date = Date.strptime(row[:death_date], '%d.%m.%Y') unless row[:death_date].nil?  
      
      persons << p
    end  

  end

  def self.parseOrgans(file_path)  

    header = ['id', 'superior_organ', 'organ_type', 'abbreviation', 'name_cz', 'name_en', 'establishment_date', 'termination_date', 'priority', 'organ_base']	  

    csv =  SmarterCSV.process(File.open(file_path, 'r:iso-8859-2:utf-8'), {
    	:headers_in_file => false, 
    	:col_sep => "|", 
    	:user_provided_headers => header
    }) 
    
    organs = []

    csv.each do |row|
      o = Organ.new	
      o.id = row[:id]
      o.superior_organ = row[:superior_organ]
      o.organ_type =  row[:organ_type]
      o.abbreviation = row[:abbreviation]
      o.name_cz = row[:name_cz]
      o.name_en = row[:name_en]
      o.establishment_date = Date.strptime(row[:establishment_date], '%d.%m.%Y') unless row[:establishment_date].nil?
      o.termination_date = Date.strptime(row[:termination_date], '%d.%m.%Y') unless row[:termination_date].nil?  
      o.organ_base = row[:organ_base]

      organs << o     
    end  

  end

  def self.parseDeputies(file_path)  

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
      d.election_region =  row[:election_region]
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

  def self.parseFunctions(file_path)  

    header = ['id', 'organ', 'type', 'name_cz', 'priority']	  

    csv =  SmarterCSV.process(File.open(file_path, 'r:iso-8859-2:utf-8'), {
    	:headers_in_file => false, 
    	:col_sep => "|", 
    	:user_provided_headers => header
    })

    functions = [] 
    
    csv.each do |row|
      f = Function.new	
      f.id = row[:id]
      f.organ = row[:organ]
      f.type =  row[:type]
      f.name_cz = row[:name_cz]
      f.priority = row[:priority]

      functions << f     
    end  

  end

end


Parser.parsePersons('data/osoby.unl')
Parser.parseOrgans('data/organy.unl')
Parser.parseDeputies('data/poslanec.unl')
Parser.parseFunctions('data/funkce.unl')
# TODO resolve binding - for example: a deputy has reference to a person, but now is stored id of person