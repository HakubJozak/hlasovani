require 'smarter_csv'
require_relative '../model/person'

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
 end 
# TODO resolve binding - for example: a deputy has reference to a person, but now is stored id of person