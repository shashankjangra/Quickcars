class CreateSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :slots do |t|
      t.integer :no_slots
      t.date :from_date
      t.date :to_date
      t.integer :amount
      t.integer :requests
      t.boolean :request_approve
      t.references :car, null: false, foreign_key: true
      t.timestamps
    end
  end
end
