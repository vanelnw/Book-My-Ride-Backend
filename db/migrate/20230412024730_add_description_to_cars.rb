class AddDescriptionToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :description, :text
  end
end
