class RemovePricefromcar < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :price
  end
end
