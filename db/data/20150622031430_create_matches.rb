class CreateMatches < SeedMigration::Migration
  def up
    independiente = Team.find_by(:name => "Club Atletico Independiente")
    barcelona = Team.find_by(:name => "Barcelona FC")
    juventus = Team.find_by(:name => "Juventus")
    mc = Team.find_by(:name => "Manchester City")
    mu = Team.find_by(:name => "Manchester United")

    Match.create(:local_team => independiente, :visitor_team => mu, :date => (DateTime.now + 1.week))
    Match.create(:local_team => barcelona, :visitor_team => mc, :date => (DateTime.now + 1.week))
    Match.create(:local_team => juventus, :visitor_team => barcelona, :date => (DateTime.now + 1.week))
    Match.create(:local_team => barcelona, :visitor_team => juventus, :date => (DateTime.now + 2.week))
    Match.create(:local_team => independiente, :visitor_team => juventus, :date => (DateTime.now + 2.week))
  end

  def down

  end
end
