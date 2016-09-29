# CZ: Tisky_za
class PrintDependent
  attr_accessor :id, :number, :number_after_slash, :council_history, :type, :name,
                :name_full, :date_of_deliver, :organ, :act_number_organ,
                :responsible_person, :url, :result, :is_sorted, :state

  def initialize(args = [])
    @id = args[:id_tisk]
    @number = args[:cislo_za]
    @council_history = args[:id_hist]
    @type = args[:id_druh]
    @name = args[:nazev_za]
    @name_full = args[:uplny_nazev_za]
    @date_of_deliver ||= args[:rozeslano] || args[:roz]
    @organ = args[:id_org]
    @act_number_organ = args[:usn_vybor]
    @responsible_person = args[:id_posl]
    @url = args[:t_url]
    @result = args[:id_vysledek]
    @number_after_slash = args[:cislo_za_post]
    @is_sorted = args[:sort_it]
    @state = args[:status]
  end
end