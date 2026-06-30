class CreateDmcColors < ActiveRecord::Migration[8.1]
  def change
    create_table :dmc_colors do |t|
      t.timestamps

      t.string :dmc_code, null: false
      t.string :name, null: false
      t.string :hex_code, null: false, limit: 7
    end
  end
end
