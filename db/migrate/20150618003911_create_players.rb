class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name, :null => false
      t.date :dob, :null => false
      t.string :nationality, :null => false
      t.timestamps
    end
  end
end
