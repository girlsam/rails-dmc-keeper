class CreateInventoryItems < ActiveRecord::Migration[8.1]
  def change
    create_table :inventory_items do |t|
      t.timestamps

      t.references :owner, null: false, foreign_key: true
      t.references :dmc_color, null: false, foreign_key: true
      t.string :status, null: false, default: "owned"
      t.integer :count, null: false, default: 0
    end
  end
end
