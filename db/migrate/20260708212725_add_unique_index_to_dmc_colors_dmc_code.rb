class AddUniqueIndexToDmcColorsDmcCode < ActiveRecord::Migration[8.1]
  def change
    add_index :dmc_colors, :dmc_code, unique: true
  end
end
