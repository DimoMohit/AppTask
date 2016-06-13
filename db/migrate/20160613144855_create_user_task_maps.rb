class CreateUserTaskMaps < ActiveRecord::Migration
  def change
    create_table :user_task_maps do |t|
      t.belongs_to :user
      t.belongs_to :task
      t.integer :status
      t.boolean :is_valid
      t.timestamps null: false
    end
  end
end
