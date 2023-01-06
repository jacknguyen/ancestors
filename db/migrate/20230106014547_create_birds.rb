class CreateBirds < ActiveRecord::Migration[7.0]
  def change
    create_table :birds do |t|
      t.references :common_ancestor, foreign_key: true

      t.timestamps
    end
  end
end
