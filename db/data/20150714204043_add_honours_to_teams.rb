class AddHonoursToTeams < SeedMigration::Migration
  def up
    independiente = Team.find_by(:name => "Club Atletico Independiente")
    barcelona = Team.find_by(:name => "Barcelona FC")
    juventus = Team.find_by(:name => "Juventus")

    sudamericana2010 = Tournament.create(:name => "Copa Subadmericana", :year => 2010)
    clausura1994 = Tournament.create(:name => "Torneo Clausura", :year => 1994)
    clausura2002 = Tournament.create(:name => "Torneo Clausura", :year => 2002)
    supercopa94 = Tournament.create(:name => "Supercopa", :year => 1994)
    supercopa95 = Tournament.create(:name => "Supercopa", :year => 1995)
    libertadores84 = Tournament.create(:name => "Copa Libertatores", :year => 1984)
    intercontinental84 = Tournament.create(:name => "Copa Intercontinental", :year => 1984)

    ucl2015   = Tournament.create(:name => "UCL", :year => 2015)
    liga_bbva = Tournament.create(:name => "Liga BBVA", :year => 2015)
    copa_del_rey = Tournament.create(:name => "Copa del Rey", :year => 2015)

    serie_a = Tournament.create(:name => "Serie A", :year => 2015)
    copa_italia = Tournament.create(:name => "Copa de italia", :year => 2015)
    
    TeamTournament.create(:team => independiente, :tournament => sudamericana2010, :position => 1)
    TeamTournament.create(:team => independiente, :tournament => clausura1994, :position => 1)
    TeamTournament.create(:team => independiente, :tournament => clausura2002, :position => 1)
    TeamTournament.create(:team => independiente, :tournament => supercopa94, :position => 1)
    TeamTournament.create(:team => independiente, :tournament => supercopa95, :position => 1)
    TeamTournament.create(:team => independiente, :tournament => libertadores84, :position => 1)
    TeamTournament.create(:team => independiente, :tournament => intercontinental84, :position => 1)

    TeamTournament.create(:team => barcelona, :tournament => ucl2015, :position => 1)
    TeamTournament.create(:team => barcelona, :tournament => liga_bbva, :position => 1)
    TeamTournament.create(:team => barcelona, :tournament => copa_del_rey, :position => 1)
    
    TeamTournament.create(:team => juventus, :tournament => ucl2015, :position => 2)
    TeamTournament.create(:team => juventus, :tournament => serie_a, :position => 1)
    TeamTournament.create(:team => juventus, :tournament => copa_italia, :position => 1)
  end

  def down

  end
end
