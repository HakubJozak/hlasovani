# CZ: Stav
class PrintStateType
  # Keys
  attr_accessor :id
  attr_accessor :description

  def initialize(args = [])
    @id = args[:id_typ]
    @description = args[:popis_stavu]
  end
end