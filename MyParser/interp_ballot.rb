require 'logger' 
require 'pathname'
require 'active_support'
require 'active_support/core_ext/module/delegation'


class Interp_ballot
  attr_accessor :id_ballot, :date_ballot, :type_ballot, :time_ballot, :id_session, :id_session_item, :session, :id_org

  def to_s
    "Interpelation ballot #{@id_ballot}, #{@date_ballot}, #{@type_ballot}, #{@time_ballot}, #{@id_session}, #{@id_session_item}, #{@session}, #{@id_org},"
  end

end
