class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.integer :player_id
      t.integer :game_id
      t.integer :stat_id
      t.float :value

      t.timestamps
    end
  end
end
