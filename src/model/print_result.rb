# CZ: Vysledek
class PrintResult
  attr_accessor :id, :description

  def initialize(args = [])
    @id = args[:id_vysledek]
    @description = args[:druh_vysledek]
  end
end