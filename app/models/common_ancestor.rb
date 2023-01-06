class CommonAncestor < ApplicationRecord
  belongs_to :parent, class_name: 'CommonAncestor', optional: true
  has_many :birds

  def self.nodes(num)
    results = ActiveRecord::Base.connection.execute(recursive_query(num))
    results.to_a.collect(&:values).flatten.reverse
  end

  def self.recursive_query(num)
    <<~SQL.squish
      WITH RECURSIVE nodes AS (
        SELECT * FROM common_ancestors WHERE id in (#{num})
        UNION
        SELECT ca.id, ca.parent_id
        FROM nodes n
        JOIN common_ancestors ca
        ON n.parent_id = ca.id
      )
      SELECT id FROM nodes;
    SQL
  end
end
