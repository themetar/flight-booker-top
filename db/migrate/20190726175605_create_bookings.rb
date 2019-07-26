class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :flight, foreign_key: true
      t.integer :number_passengers

      t.timestamps
    end
  end
end
