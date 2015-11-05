# CZ: Druh tisku
class PrintType
  attr_accessor :id
  attr_accessor :name # Název druhu tisku
  attr_accessor :name_abbr # Skratka druhu: T = "hlavní tisk", Z = "následný tisk", X = "historické druhy tisku"

  def initialize(args = [])
    @id = args[:id_druh]
    @name = args[:nazev_druh]
    @name_abbr = args[:druh_t]
  end
end