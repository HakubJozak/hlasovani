# CZ: Vysledek
class PrintResult
  attr_accessor :id
  attr_accessor :description

  # id_vysledek druh_vysledek
  def initialize(args = [])
    @id = args[:id_vysledek]
    @description = args[:druh_vysledek]
  end
end