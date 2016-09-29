# CZ: Snemovni tisk
class Print
  attr_accessor :id, :type, :print_state, :number, :number_after_slash, :proposer_type,
                :organ, :organ_election_term, :person, :proposer, :name, :name_full,
                :proposed_at, :delivered_at, :next_discussion_at, :electronic_version_at,
                :discussion_date_change_type, :discussion_date_change, :is_fast_proposal,
                :url, :is_eu, :with_vote_of_no_confidence, :state

  def initialize(args = [])
    @id = args[:id_tisk]
    @type = args[:id_druh]
    @print_state = args[:id_stav]
    @number = args[:ct]
    @number_after_slash = args[:cislo_za]
    @proposer_type = args[:id_navrh]
    @organ = args[:id_org]
    @organ_election_term = args[:id_org_obd]
    @person = args[:id_osoba]
    @proposer = args[:id_navrhovatel]
    @name = args[:nazev_tisku]
    @name_full = args[:uplny_nazev_tisku]
    @proposed_at = args[:predlozeno]
    @delivered_at ||= args[:rozeslano] || args[:roz]
    @next_discussion_at = args[:dal]
    @electronic_version_at = args[:tech_nos_dat]
    @discussion_date_change_type = args[:zm_lhuty]
    @discussion_date_change = args[:lhuta]
    @is_fast_proposal = args[:rj]
    @url = args[:t_url]
    @is_eu = args[:is_eu]
    @with_vote_of_no_confidence = args[:is_sdv]
    @state = args[:status]
  end
end