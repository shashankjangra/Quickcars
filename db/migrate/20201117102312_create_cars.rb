class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :cartype
      t.string :make
      t.string :model
      t.integer :seats
      t.integer :year
      t.date :serviced

      t.timestamps
    end
  end
end
