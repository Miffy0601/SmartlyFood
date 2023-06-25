class CreateWakeupTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :wakeup_times do |t|
      t.string :wakeup
      t.timestamps null:false
      t.string :wakeup_message
      t.string :sleep_message
      t.integer :user_id
    end
  end
end
