# CZ: Stav
class PrintState
  # Keys
  attr_accessor :id
  attr_accessor :state_type # see PrintStateType, Typ druhu stavu
  attr_accessor :print_type # see PrintType, Typ druhu tisku
  attr_accessor :description
  attr_accessor :days_until_next_discussion # CZ: lhuta, lhuta_where, Počet dní k možnému dalšímu postupu v projednávání tisku, viz stavy:lhuta_where
  # lhuta_where Identifikátor přechodu, od něhož se bude počítat lhůta k dalšímu možnému postupu v projednávání tisku (viz prechody:id_prechod a stavy:lhuta). Výpočet není nutno provádět, je prováděn automaticky u každého tisku, viz tisk:dal. Navíc, pro některé stavy se použijí speciální vyjímky a lhůta může záviset na více údajích, viz tabulka hist.

  #id_stav id_typ id_druh popis lhuta lhuta_where
  def initialize(args = [])
    @id = args[:id_stav]
    @state_type = args[:id_typ]
    @print_type = args[:id_druh]
    @description = args[:popis]
    @days_until_next_discussion = args[:lhuta] # lhuta_where
  end
end