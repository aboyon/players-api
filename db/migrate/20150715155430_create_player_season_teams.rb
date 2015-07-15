class CreatePlayerSeasonTeams < ActiveRecord::Migration
  def change
    create_table :player_season_teams do |t|
      t.integer :player_id
      t.integer :team_id
      t.integer :season
      t.date :start_at
      t.date :end_at
      t.boolean :active

      t.timestamps
    end
  end
end
