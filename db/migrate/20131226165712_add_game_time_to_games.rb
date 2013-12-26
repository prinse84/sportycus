class AddGameTimeToGames < ActiveRecord::Migration
  def change
    add_column :games, :game_time, :time
  end
end
