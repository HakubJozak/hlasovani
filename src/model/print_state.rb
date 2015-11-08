# CZ: Stav
class PrintState
  attr_accessor :id, :state_type, :print_type, :description, :days_until_next_discussion,
                :days_until_next_discussion_where

  def initialize(args = [])
    @id = args[:id_stav]
    @state_type = args[:id_typ]
    @print_type = args[:id_druh]
    @description = args[:popis]
    @days_until_next_discussion = args[:lhuta]
    @days_until_next_discussion_where = args[:lhuta_where]
  end
end