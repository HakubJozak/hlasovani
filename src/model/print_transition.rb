# CZ: Prechody
class PrintTransition
  attr_accessor :id
  attr_accessor :from_state # see PrintState
  attr_accessor :to_state # see PrintState
  attr_accessor :action # see PrintTransitionType, Typ přechodu; 1 - dle aktuálního jednacího řádu, 2 - staré jednací řády, 3 - vyjímky a speciální přechody

  # typ_prechodu
  def initialize(args = [])
    @id = args[:id_prechod]
    @from_state = args[:from_state]
    @to_state = args[:to_state]
    @action = args[:id_akce]
  end
end