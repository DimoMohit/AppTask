class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name 
      t.string :description
      t.date :start_date
      t.date :end_date
      t.integer :priority
      t.timestamps null: false
    end
  end
end
