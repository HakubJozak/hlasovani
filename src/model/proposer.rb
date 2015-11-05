# CZ: Předkladatel
class Proposer
  attr_accessor :id
  attr_accessor :print # see Print
  attr_accessor :person # see Person
  attr_accessor :index # Pořadí osoby v seznamu
  attr_accessor :type # Typ záznamu. 0 = "předkladatel", 1 = "Jako předkladatel se připojil později"
  attr_accessor :proposer_type # Typ navrhovatele. vyplněno pouze je-li tisky : id_druh = 2 (nevládní návrhy zákonů).
  attr_accessor :proposer_description # Používá se k doplnění navrhovatele, resp.jeho zástupce, který vychází z typu tisku a druhu navrhovatele, viz tisky: id_druh a tisky: id_navrh, případně u skupiny poslanců ze seznamu předkladatelů, viz tabulka predkladatel.

  def initialize(args = [])
    @id
    @print = args[:id_tisk]
    @person = args[:id_osoba]
    @index = args[:poradi]
    @type = args[:typ]
    @proposer_type
    @proposer_description
  end
end