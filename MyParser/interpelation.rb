require 'logger' 
require 'pathname'
require 'active_support'
require 'active_support/core_ext/module/delegation'


class Interpelation
  attr_accessor :id_interp_result, :id_interp_ballot, :id_deputy, :id_minister, :long_text, :priority_by_ballot, :priority_by_author, :short_text
  attr_accessor :id_type, :steno

  def to_s
        "Interpelation #{@id_interp_result}, #{@id_interp_ballot}, #{@id_deputy}, #{@id_minister}, #{@long_text}, #{@priority_by_ballot}, #{@priority_by_author}, 
        #{@short_text}"
  end

end