# CZ: Hist
class PropositionHistory
  attr_accessor :id, :print, :date, :voting, :transition, :meeting_point,
                :meeting_number, :act_number, :responsible_person_by_council,
                :responsible_by_chairman, :act_number_council, :publication_at,
                :publication_number_part, :publication_number, :notes

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
    @publication_at = args[:zaver_publik]
    @publication_number_part = args[:zaver_sb_castka]
    @publication_number = args[:zaver_sb_cislo]
    @notes = args[:poznamka]
  end
end
