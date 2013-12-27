class AddRunsToGame < ActiveRecord::Migration
  def change
    add_column :games, :team_runs, :integer
    add_column :games, :opponent_team_runs, :integer
  end
end
