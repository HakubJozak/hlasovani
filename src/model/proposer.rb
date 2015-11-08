# CZ: Předkladatel
class Proposer
  attr_accessor :print, :person, :index, :type

  def initialize(args = [])
    @print = args[:id_tisk]
    @person = args[:id_osoba]
    @index = args[:poradi]
    @type = args[:typ]
  end
end