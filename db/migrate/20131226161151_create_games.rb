class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :opponent
      t.integer :season_id

      t.timestamps
    end
    add_index :games, [:season_id]
  end
end
