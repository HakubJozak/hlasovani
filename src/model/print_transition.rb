# CZ: Prechody
class PrintTransition
  attr_accessor :id, :from_state, :to_state, :action, :transition_type

  # typ_prechodu
  def initialize(args = [])
    @id = args[:id_prechod]
    @from_state = args[:from_state]
    @to_state = args[:to_state]
    @action = args[:id_akce]
    @transition_type = args[:typ_prechodu]
  end
end