class AddUserRefToReservations < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :user, null: false, foreign_key: { to_table: 'users' }
  end
end
