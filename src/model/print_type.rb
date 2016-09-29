# CZ: Druh tisku
class PrintType
  attr_accessor :id, :name, :name_abbr

  def initialize(args = [])
    @id = args[:id_druh]
    @name = args[:nazev_druh]
    @name_abbr = args[:druh_t]
  end
end