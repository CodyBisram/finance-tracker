class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :stocks, :ticket, :ticker
  end
end
