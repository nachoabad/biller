class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.date :due_date
      t.date :paid_date
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
