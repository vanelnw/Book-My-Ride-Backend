class AddCarRefToReservations < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :car, null: false, foreign_key: { to_table: 'cars' }
  end
end
