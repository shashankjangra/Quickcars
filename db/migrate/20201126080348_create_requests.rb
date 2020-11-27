class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :no_requests
      t.string :user
      t.references :slot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
