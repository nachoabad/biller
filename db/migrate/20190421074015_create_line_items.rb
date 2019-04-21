class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.references :item, foreign_key: true
      t.references :bill, foreign_key: true

      t.timestamps
    end
  end
end
