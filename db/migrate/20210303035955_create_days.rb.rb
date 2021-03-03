class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.string :day
      t.string :workout
      t.integer :user_id
    end
  end
end
