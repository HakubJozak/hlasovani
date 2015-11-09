require 'logger' 
require 'pathname'
require 'active_support'
require 'active_support/core_ext/module/delegation'


class State
  attr_accessor :id_interp_result, :id_type, :steno

  def to_s
    "State #{@id_interp_result}, #{@id_type}, #{@steno}"
  end

end