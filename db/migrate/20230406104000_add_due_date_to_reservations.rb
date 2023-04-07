class AddDueDateToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :due_date, :date
  end
end
