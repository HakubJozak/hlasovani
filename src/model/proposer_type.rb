# CZ: typ_zakon
class ProposerType
  attr_accessor :id, :description

  def initialize(args = [])
    @id = args[:id_navrh]
    @description = args[:druh_navrhovatele]
  end
end