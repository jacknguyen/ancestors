class CreateCommonAncestors < ActiveRecord::Migration[7.0]
  def change
    create_table :common_ancestors do |t|
      t.bigint :parent_id
    end

    add_index :common_ancestors, [:id, :parent_id], unique: true
  end
end
