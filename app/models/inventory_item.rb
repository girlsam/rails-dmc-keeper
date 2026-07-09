class InventoryItem < ApplicationRecord
  belongs_to :dmc_color
  belongs_to :owner

  enum :status, { owned: "owned", wishlisted: "wishlisted" }
end
