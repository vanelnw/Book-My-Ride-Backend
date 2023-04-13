class RemovePriceFromCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :price
  end
end
