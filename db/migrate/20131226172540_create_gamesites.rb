class CreateGamesites < ActiveRecord::Migration
  def change
    create_table :gamesites do |t|
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end
end
