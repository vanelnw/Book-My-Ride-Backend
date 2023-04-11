class AdddailyRateToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :dailyRate, :integer
  end
end
