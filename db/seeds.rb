require 'csv'

CSV.foreach(Rails.root.join('db/nodes.csv'), headers: true) do |row|
  CommonAncestor.create!(row.to_hash)
end
