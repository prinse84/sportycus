class CreateGameresults < ActiveRecord::Migration
  def change
    create_table :gameresults do |t|
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end
end
