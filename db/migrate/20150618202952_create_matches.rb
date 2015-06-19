class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.date :date
      t.integer :local_team_id
      t.integer :visitor_team_id

      t.timestamps
    end
  end
end
