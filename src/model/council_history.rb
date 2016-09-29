# CZ: hist_vybory
class CouncilHistory
  attr_accessor :print, :organ, :type, :proposition_history, :responsible_person,
                :index

  def initialize(args = [])
    @print = args[:id_tisku]
    @organ = args[:id_organ]
    @type = args[:type]
    @proposition_history = args[:id_hist]
    @responsible_person = args[:id_posl]
    @index = args[:poradi]
  end
end
