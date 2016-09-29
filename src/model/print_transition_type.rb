# CZ: Typ přechodu
class PrintTransitionType
  attr_accessor :id, :description

  def initialize(args = [])
    @id = args[:id_akce]
    @description = args[:popis_akce]
  end
end