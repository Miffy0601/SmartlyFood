class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :food_name
      t.integer :amount
      t.integer :quantity
      t.string :meal
      t.string :date
      t.timestamps null: false
   end
  end
end
