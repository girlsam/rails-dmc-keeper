# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'csv'

errors = []

CSV.foreach(Rails.root.join("db/seeds/dmc_colors.csv"), headers: true, header_converters: :symbol) do |row|
  DmcColor.find_or_initialize_by(dmc_code: row[:dmc_color_code]).update!(
      name:     row[:color_name],
      hex_code: row[:hex_code]
    )
  rescue ActiveRecord::RecordInvalid, ActiveRecord::StatementInvalid => e
    errors << "#{row[:dmc_color_code]}: #{e.message}"
end

abort "Seed finished with #{errors.size} failure(s):\n#{errors.join("\n")}" if errors.any?
