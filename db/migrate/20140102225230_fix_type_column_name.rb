class FixTypeColumnName < ActiveRecord::Migration
  def change
    rename_column :stats, :type, :stat_type
  end
end
