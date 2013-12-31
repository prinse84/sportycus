class AddUniqueIdentToStats < ActiveRecord::Migration
  def change
    add_column :stats, :unique_identifier, :string
  end
end
