class AddDailyRateToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :daily_rate, :integer
  end
end
