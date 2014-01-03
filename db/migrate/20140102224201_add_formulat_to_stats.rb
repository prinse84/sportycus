class AddFormulatToStats < ActiveRecord::Migration
  def change
    add_column :stats, :formula, :string
  end
end
