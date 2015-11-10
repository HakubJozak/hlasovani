require 'logger' 
require 'pathname'
require 'active_support'
require 'active_support/core_ext/module/delegation'


class Result
  attr_accessor :id_interp_result, :text, :priority 

  def to_s
    "Result #{@id_interp_result}, #{@text}, #{@priority}"
  end

end