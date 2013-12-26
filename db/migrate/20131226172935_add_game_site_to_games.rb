class AddGameSiteToGames < ActiveRecord::Migration
  def change
    add_column :games, :gamesite_id, :integer
  end
end
