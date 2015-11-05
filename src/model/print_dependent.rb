# CZ: Tisky_za
class PrintDependent
  attr_accessor :id
  attr_accessor :type # see PrintType:type_id

  attr_accessor :number_after_slash # CZ: cislo za lomitkem, Obvykle je rovno 0, v jiných hodnotách se zpravidla jedná o opravené/přepracované verze dokumentu.Zobrazuje se u tisků od poloviny 1.volebního období PS, 1993-1996, viz výše.
  attr_accessor :proposition_history # see PropositionHistory
  attr_accessor :name # The name of this print
  attr_accessor :name_full # char(X) Úplný název sněmovního tisku, X > 1340.
  attr_accessor :number # CZ: ct, cislo tisku # Pokud je tisk: id_druh in (41, 45, 46, 47), pak do reference k číslu tisku patří i -E.
  attr_accessor :authority # CZ: id_org, see Authority: authority_id, Vyplněno pouze pokud navrhovatelem je instituce či orgán.
  attr_accessor :act_number_council
  attr_accessor :responsible_person
  attr_accessor :date_of_propose # CZ: predlozeno, Datum předložení tisku.
  attr_accessor :date_of_deliver # CZ: rozeslano = roz, Datum rozeslání tisku poslancům.Od prosince 2011 se používá tisky: roz (určení rozeslání poslancům v elektronické verzi s přesností na minuty).
  attr_accessor :is_sorted
  attr_accessor :url # URL k textu sněmovního tisku, pokud není vyplněno, vytváří se dle vzoru.
  attr_accessor :result # See PrintResult
  attr_accessor :state # Pokud je vyplněno, pak uchovává status sněmovního tisku; 1 nebo 2 : revokováno.

  # usn_vybor cislo_za_post
  def initialize(args = [])
    @id = args[:id_tisk]
    @type = args[:id_druh]
    @number_after_slash = args[:cislo_za]
    @proposition_history = args[:id_hist]
    @name = args[:nazev_za]
    @name_full = args[:uplny_nazev_za]
    @number = args[:ct]
    @authority = args[:id_org]
    @act_number_council = args[:usn_vybor]
    @responsible_person = args[:id_posl]
    @date_of_propose = args[:predlozeno]
    @date_of_deliver = args[:rozeslano]
    @is_sorted = args[:sort_it]
    @url = args[:t_url]
    @result = args[:id_vysledek]
    @state = args[:status]
  end
end