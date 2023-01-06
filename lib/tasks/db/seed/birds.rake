# frozen_string_literal: true

namespace 'db:seed' do
  desc 'Seed database with birds'

  task birds: :environment do
    common_ancestor_ids = %w[
      1045178
      2138651
      2138692
      2170536
      2172226
      2172253
      2172254
      2170534
      5926678
      2169160
      2172224
      2172222
      2168987
      1167881
      2172251
    ]

    common_ancestor_ids.each do |id|
      Bird.create!(common_ancestor_id: id)
    end
  end
end
