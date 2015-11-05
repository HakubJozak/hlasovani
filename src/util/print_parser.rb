require 'smarter_csv'
load '../model/council_history.rb'
load '../model/print.rb'
load '../model/print_dependent.rb'
load '../model/print_result.rb'
load '../model/print_state.rb'
load '../model/print_state_type.rb'
load '../model/print_transition.rb'
load '../model/print_transition_type.rb'
load '../model/print_type.rb'
load '../model/proposer.rb'
load '../model/proposition_history.rb'

class PrintParser
  attr_accessor :council_history, :print, :print_dependent,
                :print_result, :print_state, :print_state_type, :print_transition,
                :print_transition_type, :print_type, :proposer, :proposition_history

  def initialize
    @files = {
      print_type: '../../data/druh_tisku.unl',
      proposition_history: '../../data/hist.unl',
      council_history: '../../data/hist_vybory.unl',
      print_transition: '../../data/prechody.unl',
      proposer: '../../data/predkladatel.unl',
      print_state: '../../data/stavy.unl',
      print: '../../data/tisky.unl',
      print_dependent: '../../data/tisky_za.unl',
      print_transition_type: '../../data/typ_akce.unl',
      print_state_type: '../../data/typ_stavu.unl',
      law_type: '../../data/typ_zakon.unl',
      print_result: '../../data/vysledek.unl'
    }
    @headers = {
      print_type: %w'id_druh druh_t nazev_druh',
      proposition_history: %w'id_hist id_tisk datum id_hlas id_prechod id_bod schuze usnes_ps orgv_id_posl ps_id_posl orgv_p_usn zaver_publik zaver_sb_castka zaver_sb_cislo poznamka',
      council_history: %w'id_tisku id_organ typ id_hist id_posl poradi',
      print_transition: %w'id_prechod odkud kam id_akce typ_prechodu',
      proposer: %w'id_tisk id_osoba poradi typ',
      print_state: %w'id_stav id_typ id_druh popis lhuta lhuta_where',
      print: %w'id_tisk id_druh id_stav ct cislo_za id_navrh id_org id_org_obd id_osoba navrhovatel nazev_tisku predlozeno rozeslano dal tech_nos_dat uplny_nazev_tisku zm_lhuty lhuta rj t_url is_eu roz is_sdv status',
      print_dependent: %w'id_tisk cislo_za id_hist id_druh nazev_za uplny_nazev_za rozeslano id_org usn_vybor id_posl t_url id_vysledek cislo_za_post sort_it roz status',
      print_transition_type: %w'id_akce popis_akce',
      print_state_type: %w'id_typ popis_stavu',
      law_type: %w'id_navrh druh_navrhovatele',
      print_result: %w'id_vysledek druh_vysledek'
    }
    @council_history = []
    @print = []
    @print_dependent = []
    @print_result = []
    @print_state = []
    @print_state_type = []
    @print_transition = []
    @print_transition_type = []
    @print_type = []
    @proposer = []
    @proposition_history = []
  end


  def parse
    results = {}
    @files.each do |key, filename| # insert headers and parse
      p "Parsing #{filename}"
      # results[key] = SmarterCSV.process("#{filename}_tmp", force_simple_split: true, col_sep: '|', file_encoding: 'Windows-1250', verbose: true)
      results[key] = SmarterCSV.process(File.open(filename, 'r:Windows-1250'),
                                        force_simple_split: true,
                                        col_sep: '|',
                                        quote_char: '^',
                                        headers_in_file: false,
                                        user_provided_headers: @headers[key],
                                        verbose: true
      )
    end
    results
  end

  def create_classes
    results = parse
    results[:council_history].each do |args|
      @council_history << CouncilHistory.new(args)
    end

    results[:print].each do |args|
      @print << Print.new(args)
    end

    results[:print_dependent].each do |args|
      @print_dependent << PrintDependent.new(args)
    end

    results[:print_result].each do |args|
      @print_result << PrintResult.new(args)
    end

    results[:print_state].each do |args|
      @print_state << PrintState.new(args)
    end

    results[:print_state_type].each do |args|
      @print_state_type << PrintStateType.new(args)
    end

    results[:print_transition].each do |args|
      @print_transition << PrintTransition.new(args)
    end

    results[:print_transition_type].each do |args|
      @print_transition_type << PrintTransitionType.new(args)
    end

    results[:print_type].each do |args|
      @print_type << PrintType.new(args)
    end

    results[:proposer].each do |args|
      @proposer << Proposer.new(args)
    end

    results[:proposition_history].each do |args|
      @proposition_history << PropositionHistory.new(args)
    end
  end

end

PrintParser.new.create_classes