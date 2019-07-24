class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :from_airport_id
      t.integer :to_airport_id
      t.datetime :departure
      t.integer :duration

      t.timestamps
    end
    add_index :flights, :from_airport_id
    add_index :flights, :to_airport_id
    add_index :flights, [:from_airport_id, :to_airport_id]
    add_index :flights, :departure
  end
end
