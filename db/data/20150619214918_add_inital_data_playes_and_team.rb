class AddInitalDataPlayesAndTeam < SeedMigration::Migration
  def up
    players = [
      {:name => "Lionel Messi", :dob => "1989-10-15", :nationality => "ARG"},
      {:name => "Wayne Rooney", :dob => "1986-11-15", :nationality => "ENG"},
      {:name => "Andres Iniesta", :dob => "1983-09-15", :nationality => "ESP"},
      {:name => "Federico Mancuello", :dob => "1987-10-11", :nationality => "ARG"},
      {:name => "Leandro Grech", :dob => "1984-12-12", :nationality => "ARG"},
      {:name => "Esteban Cambiasso", :dob => "1980-11-13", :nationality => "ARG"},
    ]
    players.each do |player|
      Player.create(player)
    end

    teams = [
      {:name => "Club Atletico Independiente"},
      {:name => "Barcelona FC"},
      {:name => "Juventus"},
      {:name => "Manchester City"},
      {:name => "Manchester United"},
      {:name => "Bayern Munich"},
    ]

    teams.each do |team|
      Team.create(team)
    end
  end

  def down

  end
end
