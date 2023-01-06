# frozen_string_literal: true

require 'csv'

namespace 'db:seed' do
  desc "Seed database with Common Ancestors by loading from 'nodes.csv'"

  task common_ancestors: :environment do
    CSV.foreach(Rails.root.join('db/nodes.csv'), headers: true) do |row|
      begin
        CommonAncestor.create!(row.to_hash)
      rescue
        next
      end
    end
  end
end
