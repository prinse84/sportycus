class AddTypeToStats < ActiveRecord::Migration
  def change
    add_column :stats, :type, :string
  end
end
