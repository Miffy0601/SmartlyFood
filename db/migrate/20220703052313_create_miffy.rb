class CreateMiffy < ActiveRecord::Migration[6.1]
  def change
    create_table :miffy do |t|
      t.string :name
      t.integer :age
      t.integer :height
      t.string :prefecture
      t.timestamps null: false
  end
end
end
