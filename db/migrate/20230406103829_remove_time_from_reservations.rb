class RemoveTimeFromReservations < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :time, :time
  end
end
