class AddGameResultIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :gameresult_id, :integer
  end
end
