class RenameDateColumnInReservation < ActiveRecord::Migration[7.0]
  def change
    rename_column :reservations, :date, :reservation_date
  end
end
