class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :image
      t.integer :year
      t.integer :price

      t.timestamps
    end
  end
end
