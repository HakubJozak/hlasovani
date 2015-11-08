# CZ: Typ stavu
class PrintStateType
  attr_accessor :id, :description

  def initialize(args = [])
    @id = args[:id_typ]
    @description = args[:popis_stavu]
  end
end