# CZ: hist_vybory
class CouncilHistory
  attr_accessor :print # See Print
  attr_accessor :authority # See Authority
  attr_accessor :type # 1/2/3
  attr_accessor :proposition_history # See PropositionHistory
  attr_accessor :responsible_person # See MemberOfParliament
  attr_accessor :index

  # id_tisku id_organ typ id_hist id_posl poradi
  def initialize(args = [])
    @print = args[:id_tisku]
    @authority = args[:id_organ]
    @type = args[:type]
    @proposition_history = args[:id_hist]
    @responsible_person = args[:id_posl]
    @index = args[:poradi]
  end
end
