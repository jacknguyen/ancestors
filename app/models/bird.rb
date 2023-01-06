class Bird < ApplicationRecord
  belongs_to :common_ancestor

  scope :find_by_ancestors, -> (ids) { find_by_sql(recursive_query(ids)) }

  def self.recursive_query(ids)
    <<~SQL
      WITH RECURSIVE
        cas AS (SELECT * FROM common_ancestors WHERE id IN (#{ids})),
        nodes AS (SELECT *
                  FROM cas
                  UNION
                  SELECT ca.id, ca.parent_id
                  FROM nodes n
                  JOIN common_ancestors ca
                  ON ca.parent_id = n.id),
        birdies AS (SELECT * FROM birds
                    WHERE common_ancestor_id
                    IN (SELECT id FROM nodes))
      SELECT *
      FROM birdies;
    SQL
  end
end
