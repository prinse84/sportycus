class AddGameDateToGames < ActiveRecord::Migration
  def change
    add_column :games, :game_date, :date
  end
end
