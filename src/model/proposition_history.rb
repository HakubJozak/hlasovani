# CZ: Hist
class PropositionHistory
  attr_accessor :id
  attr_accessor :print # See Print
  attr_accessor :date
  attr_accessor :voting # See Voting
  attr_accessor :transition # See PrintTransition
  attr_accessor :meeting_point # See MeetingPoint, bod schuze
  attr_accessor :meeting_number # Číslo schuze, na které bylo projednáváno
  attr_accessor :act_number # Číslo usnesení poslanecké snemovny
  attr_accessor :responsible_person_by_council # See MemberOfParliament - zodpovedný za výbory
  attr_accessor :responsible_by_chairman # See MemberOfParliament - zodpovedný za predsedu snemovne
  attr_accessor :act_number_council # Cislo usneseni vyboru alebo predsedu snemovny
  attr_accessor :date_of_publication
  attr_accessor :publication_number
  attr_accessor :notes

  # zaver_sb_cislo
  def initialize(args = [])
    @id = args[:id_hist]
    @print = args[:id_tisk]
    @date = args[:datum]
    @voting = args[:id_hlas]
    @transition = args[:id_prechod]
    @meeting_point = args[:id_bod]
    @meeting_number = args[:schuze]
    @act_number = args[:usnes_ps]
    @responsible_person_by_council = args[:orgv_id_posl]
    @responsible_by_chairman = args[:ps_id_posl]
    @act_number_council = args[:orgv_p_usn]
    @date_of_publication = args[:zaver_publik]
    @publication_number = args[:zaver_sb_castka] # zaver_sb_cislo?
    @nodes = args[:poznamka]
  end
end
