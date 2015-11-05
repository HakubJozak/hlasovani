# CZ: Snemovni tisk
class Print
  attr_accessor :id
  attr_accessor :type # See PrintType:type_id
  attr_accessor :state # See PrintState:state_id. The print was discussed, if state.state_type == 6
  attr_accessor :number # If type in (41,45,46,47), then number is with -E.
  attr_accessor :number_after_slash # Typically 0, in other cases it means: corrected/revised version.
  attr_accessor :name
  attr_accessor :name_full # Size > 1340.

  attr_accessor :authority # See Authority, Filled only if proposer is authority ("orgán").
  attr_accessor :authority_election_term # See Authority
  attr_accessor :proposers # see Proposers, p. or delegated person. There could be more proposers (array)

  attr_accessor :date_of_propose
  attr_accessor :date_of_deliver # Date of deliver to members of parliament. Since 2011 it's sent electronically (DateTime).
  attr_accessor :date_of_next_discussion # Date of the nearest start of discussion.
  attr_accessor :discussion_date_change # Date of next discussion: lehota: 1 - zkrácení, 2 - prodloužení
  attr_accessor :is_fast_proposal
  attr_accessor :is_eu
  attr_accessor :with_vote_of_no_confidence

  attr_accessor :date_of_e_version
  attr_accessor :url

  attr_accessor :state # 1 or 2 : revoked.

  # id_osoba navrhovatel zm_lhuty roz
  def initialize(args = [])
    @id = args[:id_tisk]
    @type = args[:id_druh]
    @state = args[:id_stav]
    @number = args[:ct]
    @number_after_slash = args[:cislo_za]
    @name = args[:nazev_tisku]
    @name_full = args[:uplny_nazev_tisku]
    @authority = args[:id_org]
    @authority_election_term = args[:id_org_obd]
    @proposers = args[:id_navrh] # TODO: Fix more proposers
    @date_of_propose = args[:predlozeno]
    @date_of_deliver = args[:rozeslano]
    @date_of_next_discussion = args[:dal]
    @discussion_date_change = args[:lhuta] # TODO: zm_lhuty
    @is_fast_proposal = args[:rj]
    @is_eu = args[:is_eu]
    @with_vote_of_no_confidence = args[:is_sdv]
    @date_of_e_version = args[:tech_nos_dat]
    @url = args[:t_url]
    @state = args[:status]
  end
end