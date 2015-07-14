class CreateTeamTournaments < ActiveRecord::Migration
  def change
    create_table :team_tournaments do |t|
      t.integer :team_id
      t.integer :tournament_id
      t.integer :position

      t.timestamps
    end

    add_index :team_tournaments, [:team_id, :tournament_id], :unique => true
  end
end
