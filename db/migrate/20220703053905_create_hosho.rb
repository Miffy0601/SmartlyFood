class CreateHosho < ActiveRecord::Migration[6.1]
  def change
    create_table :hosho do |t|
    t.integer :number
    t.string :clothes
    t.integer :size
    t.integer :count
  end
end
end
